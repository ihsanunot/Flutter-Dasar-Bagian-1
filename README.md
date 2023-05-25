# Belajar Dasar Flutter (Bagian 2)

**WAJIB RUN PAKAI SINTAKS DI TERMINAL**

*Cara Running di Chrome:*

```
flutter run -d chrome --web-renderer html
```
![1](https://github.com/ihsanunot/Flutter-Dasar-Bagian-1/assets/127992374/1f7d026f-eaef-4958-81df-fc43bde9ccc7)
![2](https://github.com/ihsanunot/Flutter-Dasar-Bagian-1/assets/127992374/48290a75-1e32-4523-b40a-3917081772b0)

## Slivers

Slivers adalah sebagian area yang dapat di-scroll.

Lalu apa beda nya dengan  widget scrolling seperti ListView dan GridView?  

**Slivers hanya digunakan pada kasus-kasus tertentu.**

Jika tampilan scrolling cukup sederhana, cukup gunakan ListView dan GridView saja.

**Slivers**

Slivers sendiri adalah konfigurasi yang lebih low-level untuk widget scrolling. 

Ini memungkinkan kita melakukan kustomisasi terhadap scrolling yang lebih kompleks.


Ok untuk testing siapkan saja 2 foto seperti foto profil atau banner

Buatlah folder baru bernama assets dan letakkan aset gambar ke dalam folder tersebut. 

Jangan lupa untuk mendaftarkan aset ke dalam project melalui berkas pubspec.yaml.

```
flutter:
  uses-material-design: true
 
  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/
```
Selanjutnya buat berkas baru bernama strings.dart. Di sini kita akan menyimpan konten teks yang akan kita tampilkan.

```
const contentText =
    'Google officially announced its much-anticipated Pixel phones; the Pixel and Pixel XL, on October 4. We attended Google’s London UK event, mirroring the main one taking place in San Francisco, US, where the firm unwrapped the new Android 7.1 Nougat devices which will apparently usurp Google’s long-standing Nexus series.';
const contentSpecsDisplay =
    "5.0 inches\nFHD AMOLED at 441ppi\n2.5D Corning® Gorilla® Glass 4";
const contentSpecsSize =
    '5.6 x 2.7 x 0.2 ~ 0.3 inches 143.8 x 69.5 x 7.3 ~ 8.5 mm';
const contentSpecsBattery =
    "2,770 mAh battery\nStandby time (LTE): up to 19 days\nTalk time (3g/WCDMA): up to 26 hours\nInternet use time (Wi-Fi): up to 13 hours\nInternet use time (LTE): up to 13 hours\nVideo playback: up to 13 hours\nAudio playback (via headset): up to 110 hours\nFast charging: up to 7 hours of use from only 15 minutes of charging";
```

Selanjutnya, kita mulai mengerjakan tampilan widget utama dengan membuat berkas pixel_page.dart.

```
class PixelPage extends StatelessWidget {
  const PixelPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
```
Jangan lupa untuk menambahkan PixelPage ke dalam widget utama MyApp

```
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Pixel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PixelPage(),
    );
  }
}
```

Sekarang ingat bahwa Slivers adalah sebagian area yang dapat di-scroll. Dalam hal ini ada dua bagian yang bisa di-scroll, yaitu AppBar dan konten utamanya. Kali ini kita menggunakan widget NestedScrollView untuk memasukkan widget scrolling ke dalam widget scrolling lain. Widget ini akan memberikan efek collapsingpada AppBar.

```
class PixelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(headerSliverBuilder: null, body: null),
    );
  }
}
```

Widget ini memerlukan dua parameter wajib yaitu headerSliverBuilder dan body.

Parameter pertama akan kita isi dengan Appbar. Untuk mendapatkan efek scrolling pada AppBar, maka kita gunakan widget SliverAppBar. Widget ini sama seperti AppBar yang biasa kita gunakan. Bedanya, widget ini memiliki parameter expandedHeight yang bisa kita isi dengan ukuran maksimal dari AppBar. Jika di-scrollukuran AppBar tersebut akan mengecil.

```
headerSliverBuilder: (context, isScrolled) {
  return [
    SliverAppBar(
      expandedHeight: 200,
    ),
  ];
},
```

AppBar bisa menghilang ketika di-scroll. Bagaimana agar AppBar tetap tampil seperti tampilan default-nya. Anda dapat menambahkan parameter pinned yang bernilai true.

```
SliverAppBar(
  pinned: true,
  expandedHeight: 200,
),
```

Kemudian kita tambahkan parameter flexibleSpace dengan widget FlexibleSpaceBar. Widget ini akan menampilkan antarmuka pengguna untuk AppBar.

```
SliverAppBar(
  pinned: true,
  expandedHeight: 200,
  flexibleSpace: FlexibleSpaceBar(
    background: Image.asset(
      'assets/pixel_google.jpg',
      fit: BoxFit.fitWidth,
    ),
    title: const Text('Google Pixel'),
    titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
  ),
),
```

Sekarang tambahkan konten utama pada parameter body

```
import 'package:new_project_flutter/strings.dart';
...
 
NestedScrollView(
  headerSliverBuilder: (context, isScrolled) {
    ...
  },
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r'$735',
                style: Theme.of(context).textTheme.headline4,
              ),
              Container(
                color: Colors.black26,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.collections,
                      color: Colors.white,
                    ),
                    Text(
                      '6 photos',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Stock hanya 5 buah',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 8),
          const Text(contentText),
          const SizedBox(height: 8),
          Text(
            'Spesifikasi',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 8),
          Table(
            columnWidths: const {1: FractionColumnWidth(0.7)},
            children: const [
              TableRow(
                children: [
                  Text('Display'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(contentSpecsDisplay),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text('Size'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(contentSpecsSize),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text('Battery'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(contentSpecsBattery),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Dijual oleh',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/photo_2.jpg'),
                  radius: 24,
                ),
              ),
              Text('Narenda Wicaksono'),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to Cart'),
                  ),
                );
              },
              child: const Text('Beli'),
            ),
          )
        ],
      ),
    ),
  ),
),
```

Susunan widget di atas tidak jauh berbeda dengan susunan widget pada umumnya. Namun, kita akan membahas widget yang baru pertama kita gunakan, yaitu Table. Sesuai namanya, widget ini digunakan untuk menyusun widget lain sebagai tabel. Anda mendefinisikan baris tabel dengan widget TableRow lalu children-nya sebagai kolom.

```
Table(
  columnWidths: const {1: FractionColumnWidth(0.7)},
  children: const [
    TableRow(
      children: [
        Text('Display'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(contentSpecsDisplay),
        ),
      ],
    ),
    TableRow(
      children: [
        Text('Size'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(contentSpecsSize),
        ),
      ],
    ),
    TableRow(
      children: [
        Text('Battery'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(contentSpecsBattery),
        ),
      ],
    ),
  ],
),
```

Parameter columnWidths digunakan untuk menentukan lebar kolom dari tabel.

**Referensi :**
- https://stackoverflow.com/questions/53372276/flutter-how-to-check-if-sliver-appbar-is-expanded-or-collapsed

---
Dart SDK version: 3.0.1 (stable)
Flutter 3.10.1 • channel stable  • DevTools 2.23.1
Java 20.0.1Java(TM) SE Runtime Environment (build 20.0.1+9-29) 

```
Ihsanunot (flutter_dasar_dcg)
```
