# Belajar Dasar Flutter (Bagian 2)

**WAJIB RUN PAKAI SINTAKS DI TERMINAL**

Cara Running di Chrome:

```
flutter run -d chrome --web-renderer html
```

Untuk Menhindari Error ini :

- error [object ProgressEvent]
- Image provider: (.....)
- Image key: (.....)

jadi biasakan run pakai terminal, jika pakai VSCode.

**Cek class nya di folder lib/widget, import widget ke main.dart** 

## Navigation & Routing

Di dalam Flutter, screen atau halaman juga dikenal dengan istilah routes. Kembali lagi pada tagline “everything is a widget”, begitu pula dengan routes.

> navigasi antar route secara dasar menggunakan Navigator.push dan Navigator.pop.
<br>

Konsep navigasi pada Flutter adalah ketika berpindah screen/activity akan menjadi **tumpukan (stack).** 


*Jadi ketika berpindah ke screen lain (push), maka screen pertama akan ditumpuk oleh screen kedua.*


Kemudian apabila kembali dari screen kedua ke pertama, maka screen kedua akan dihapus (pop).

### Route

**Pakai route** ini berguna jika kita memerlukan navigasi ke banyak halaman yang bisa memicu duplikasi code, maka dari itu solusi nya pakai route.

Konsep named route ini mirip dengan sebuah website di mana memiliki route atau endpoint untuk merujuk ke suatu halaman, **contohnya seperti /login atau /detail.**

Mari bikin beberapa Screen dengan ElevatedButton
dan MainAxis center.

> Selanjutnya untuk mendefinisikan route temukan widget MaterialApp lalu tambahkan properti initialRoute dan routes.

**Contoh :**

```
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/secondScreen': (context) => const SecondScreen(),
        '/secondScreenWithData': (context) => SecondScreenWithData(
            ModalRoute.of(context)?.settings.arguments as String),
        '/returnDataScreen': (context) => const ReturnDataScreen(),
        '/replacementScreen': (context) => const ReplacementScreen(),
        '/anotherScreen': (context) => const AnotherScreen(),
      },
    );
  }
}
```

> Jika Anda menggunakan initialRoute, pastikan Anda tidak menggunakan properti home.

Nanti juga di visualdensity class untuk beberapa optimasi agar lebih rapih.

visualdensity tidak akan memengaruhi ukuran teks, ukuran ikon, atau nilai padding.

**Tapi, ada beberapa Widget yang bisa kita pengaruhin :**

- Checkbox
- Chip
- ElevatedButton
- IconButton
- InputDecorator (which gives density support to TextField, etc.)
- ListTile
- MaterialButton
- OutlinedButton
- Radio
- RawMaterialButton
- TextButton



# Normal Navigation

Untuk melakukan navigasi ke route, Anda dapat memanggil method Navigator.pushNamed dengan dua parameter yaitu context dan nama route yang ingin dituju

## Contoh Normal Navigation

### Ke Halaman kedua
```
ElevatedButton(
  child: Text('Go to Second Screen'),
  onPressed: () {
    Navigator.pushNamed(context, '/secondScreen');
  },
),
```

### Back ke sebelumnya

Untuk kembali ke halaman sebelumnya caranya masih sama, yaitu menggunakan Navigator.pop.

```
ElevatedButton(
          child: const Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
),
```

# Navigation with data
Jika kita ingin mengirimkan data ke sebuah halaman cukup menambahkan satu parameter atau properti lagi pada method pushNamed bernama **arguments**.

Untuk mendapatkan argumen yang dikirimkan pada route tujuan kita menggunakan method **ModalRoute.of()**

**Contoh:**
```
ElevatedButton(
  child: Text('Navigation with Data'),
  onPressed: () {
    Navigator.pushNamed(context, '/secondScreenWithData', arguments: 'Hello from First Screen!');
  },
),
```

## Return data from a screen

Dalam beberapa kasus, Anda mungkin ingin mengembalikan data dari halaman baru. 

Misalnya, setelah pengguna memberikan sebuah input, Anda ingin mengolahnya di halaman sebelumnya. 

Method Navigator.pop() selain untuk menutup halaman juga berguna untuk mengembalikan nilai.

contoh kita buat halaman dengan TextField dan Button.

```
class _ReturnDataScreenState extends State<ReturnDataScreen> {
  final _textController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(labelText: 'Enter your name'),
              ),
            ),
            ElevatedButton(
              child: const Text('Send'),
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
 
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
 
```

Selanjutnya kita akan mengembalikan nilai dari input pengguna.

```
onPressed: () {
  Navigator.pop(context, _textController.text);
},
```

Kembali ke FirstScreen, kita akan membuat Navigasi untuk menuju ke ReturnDataScreen. 

Jika Anda perhatikan, method untuk push pada navigation ini sebenarnya merupakan **objek Future**. 

Artinya, metode ini bisa mengembalikan nilai di masa depan.

Oleh karena itu, kita dapat menyimpan nilainya ke dalam suatu variabel. **Jangan lupa untuk menggunakan async dan await untuk menunggu nilai yang dikembalikan**


Jika anda perhatikan property push sendiri yang di navigator sebenarnya adalah Objek Future, Artinya, metode ini bisa mengembalikan nilai di masa depan.

Oleh karena itu, kita dapat menyimpan nilainya ke dalam suatu variabel. 
Jangan lupa untuk menggunakan async dan await untuk menunggu nilai yang dikembalikan

**Contoh** di main.dart nya:
```
ElevatedButton(
              child: const Text('Return Data from Another Screen'),
              onPressed: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                final result =
                    await Navigator.pushNamed(context, '/returnDataScreen');
                SnackBar snackBar = SnackBar(content: Text('$result'));
                scaffoldMessenger.showSnackBar(snackBar);
              },
            ),
```

## Replace Screen

Kita telah membahas bahwa navigasi pada Flutter membuat halaman menjadi bertumpuk (stacked). 

Namun, Anda juga memiliki opsi untuk membuat halaman baru dengan menggantikan stack yang sedang terbuka. 

Cara ini umum digunakan pada halaman seperti splash screen atau login di mana pengguna tidak perlu kembali ke halaman tersebut ketika menekan tombol back.

Caranya, gunakan metode pushReplacement atau pushReplacementNamed jika Anda menggunakan named routes.

**Contoh:**
```
ElevatedButton(
  child: Text('Replace Screen'),
  onPressed: () {
   Navigator.pushNamed(context, '/replacementScreen');
  },
),
 
... 
 
/// replacement_screen.dart
class ReplacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Another Screen'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/anotherScreen');
          },
        ),
      ),
    );
  }
}
```

Halaman AnotherScreen akan me-replace stack dari ReplacementScreen. 

Sehinga, ketika pengguna keluar dari AnotherScreen akan langsung diarahkan ke FirstScreen.

```
class AnotherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Back to First Screen'),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```


**Referensi :**
- https://docs.flutter.dev/ui/navigation
- https://www.geeksforgeeks.org/flutter-dispose-method-with-example/
- https://stackoverflow.com/questions/54480937/what-does-context-of-widget-buildbuildcontext-context-mean-in-flutter

---

Cara Running di Chrome:

```
flutter run -d chrome --web-renderer html
```


```
Dart SDK version: 3.0.1 (stable)
Flutter 3.10.1 • channel stable  • DevTools 2.23.1
Java 20.0.1Java(TM) SE Runtime Environment (build 20.0.1+9-29) 
```
**Ihsanunot (flutter_dasar_dcg)**