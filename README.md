# Belajar Dasar Flutter (Bagian 2)

Belajar flutter sederhana basic to basic.

## Font

Untuk Menambahkan Font, anda bisa download terlebih dahulu font yang anda ingin pakai.
Contoh disini saya akan download dari google fonts dan font nya yang Oswald.

font ada dalam bagian flutter. Untuk mendaftarkan font, kita membuat bagian fonts yang ada dalam blok flutter.
Untuk mendaftarkan font Oswald kita tuliskan Oswald pada bagian family yang nantinya akan menjadi nama font yang kita panggil pada kode dart.

Lalu dalam family kita masukkan fonts yang di dalamnya terdapat asset yang nanti akan mengarah pada file font.ttf


Contoh seperti dibawah ini menambahkan asset fonts/oswald/Oswald-Regular.ttf ke dalam **pubspec.yaml**

```
  fonts:
  - family: Oswald
    fonts:
      - asset: fonts/Oswald/Oswald-Regular.ttf
```

Setelah di daftarkan, kita langsung gunakan font nya, contoh bisa di Text()

```
Text(
  'Custom Font',
  style: TextStyle(
    fontFamily: 'Oswald',
    fontSize: 30,
  ),
),
```

Kita juga bisa merubah font default sesuai keinginan kita, contoh pakai font Oswald.

**Contoh:**

```
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oswald',
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}
```

---

**Ihsanunot** (flutter_dasar_dcg)