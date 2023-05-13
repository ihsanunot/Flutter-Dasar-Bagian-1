# Belajar Dasar Flutter (Bagian 2)

Belajar flutter sederhana basic to basic.

## Navigation

Navigation adalah claas untuk berpindah dari satu screen ke screen lain.

Konsep Navigation :

Ketika berpindah screen/activity akan menjadi tumpukan (stack). 
Jadi ketika berpindah dari satu screen ke screen lain (push), maka screen pertama akan ditumpuk oleh screen kedua. 

Kemudian apabila kembali dari screen kedua ke pertama, maka screen kedua akan dihapus (pop).

* Navigator.push 

Untuk berpindah ke screen kedua kita akan menggunakan sebuah method **Navigator.push**


```
Navigator.push(context, MaterialPageRoute(builder: (context) {
   return WidgetScreen();
}));
```

Pada kode di atas Navigator.push memiliki dua parameter. Pertama ialah context dan yang kedua Route. Parameter context ini merupakan variabel BuildContext yang ada pada method build. 

Parameter route berguna untuk menentukan tujuan ke mana kita akan berpindah screen. Route tersebut kita isikan dengan MaterialPageRoute yang di dalamnya terdapat builder yang nantinya akan diisi dengan tujuan screen-nya. 

Maka untuk melakukan perpindahan screen kita akan membuat event onPressed pada tombol ElevatedButton yang ada pada screen pertama:

```
child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SecondScreen();
            }));
```

* Navigator.pop

Setelah dapat berpindah ke screen lain maka kita akan belajar menggunakan Navigator.pop untuk kembali ke screen sebelumnya.

```
Navigator.pop(context)
```

Untuk kembali dari screen kedua kita dapat menambahkan event onPressed pada OutlinedButton yang ada pada screen kedua dan kita masukkan Navigator.pop pada event, seperti berikut:

```
body: Center(
        child: OutlinedButton(
          child: const Text('Kembali'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
```

### Mengirimkan Data Antar Halaman

Seringkali beberapa halaman pada aplikasi perlu saling berinteraksi dengan berbagi dan saling mengirimkan data. 

Pada Flutter kita memanfaatkan constructor dari sebuah class untuk mengirimkan data antar halaman.

```
final String message = 'Hello from First Screen!';
```
Untuk mengirimkan variabel message tersebut ke Second Screen, maka kita akan mengirimkannya sebagai parameter dari constructor kelas SecondScreen seperti berikut:

```
onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen(message)));
          },
```

Agar Second Screen bisa menerima data tersebut, 
maka kita perlu mengubah default constructor-nya dan menambahkan variabel untuk menampung datanya

```
class SecondScreen extends StatelessWidget {
  final String message;
 
  const SecondScreen(this.message, {Key? key}) : super(key: key);
}
```

Kemudian kita dapat menampilkan data yang diterima melalui variabel yang kita buat.

```
class SecondScreen extends StatelessWidget {
  final String message;
 
  const SecondScreen(this.message, {Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            OutlinedButton(
              child: const Text('Kembali'),
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

Referensi:
* https://flutter.dev/docs/cookbook/navigation

---

**Ihsanunot** (flutter_dasar_dcg)