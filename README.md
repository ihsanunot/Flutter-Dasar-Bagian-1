# Cupertino

Flutter merupakan framework yang multiplatform. 

Meskipun Material design dirancang untuk banyak platform juga, tentunya kita ingin pengguna perangkat iOS merasa berada di “rumah” dengan menerapkan style yang umum digunakan pada aplikasi iOS.

Perlukah bikin 2 kode yang berbeda untuk UI android dan iOS?
Hmm bisa Iya bisa Tidak, jika anda ingin bener2 bikin seperti Native maka bisa 2 kali.

Tetapi karena dart bersifat logika bisnis yang dapat dipakai di kedua platform.

Anda bisa saja cukup dengan 1 code aja karena di Docs nya anda tetap bisa mengunakan Material Design di perangkat iOS.

Selain itu ada beberapa widget yang bersifat adaptif tergantung platform yang digunakan.

---

## Coding Phase

Anda bisa langsung coba ganti isi main.dart nya :

```
import 'package:flutter/cupertino.dart';
 
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp();
  }
}
```
Perhatikan pada kode di atas kita gunakan widget CupertinoApp sebagai widget aplikasi.

Widget CupertinoAppmemiliki parameter yang mirip dengan MaterialApp yang biasa kita gunakan. 

Sebagai contoh, Anda dapat mengatur tema aplikasi dan halaman utama yang ingin ditampilkan.

```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: HomePage(),
    );
  }
}
```

Pada komponen halaman kita juga bisa menggunakan widget scaffold seperti pada material. 

Namun, Cupertino memiliki dua jenis scaffold yang bisa digunakan, yaitu 

- CupertinoPageScaffold
- CupertinoTabScaffold. 

Untuk langkah awal, mari gunakan CupertinoPageScaffold.

CupertinoPageScaffold di sini mirip dengan Scaffold yang biasa digunakan pada material. 

Bedanya, CupertinoPageScaffold tidak mengenal AppBar, melainkan menggunakan widget CupertinoNavigationBar.

```
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino App'),
      ),
      child: Container(),
    );
  }
}
```

Beberapa widget dapat digunakan bersamaan karena sifatnya yang umum dan tidak ada perbedaan antara gaya material dan cupertino. 

Contohnya adalah tampilan halaman seperti berikut:

```
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino App'),
      ),
      child: Center(
        child: Text(
          'Home Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
```

Perhatikan widget yang spesifik untuk cupertino selalu diawali dengan Cupertino, misalnya CupertinoTheme untuk mendapatkan tema.

Lalu bagaimana dengan CupertinoTabScaffold? Umumnya widget ini digunakan untuk halaman utama yang memiliki navigasi berupa tab. Mari ubah HomePage menggunakan Tab Scaffold.

```
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(...),
      tabBuilder: (context, index) {...},
    );
  }
}
```

CupertinoTabScaffold membutuhkan dua parameter wajib. Parameter tabBarberisi widget CupertinoTabBar yang menampilkan item tab.

```
tabBar: CupertinoTabBar(
  items: [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.news),
      label: 'Feeds',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings),
      label: 'Settings',
    ),
  ],
),
```

Parameter tabBuilderberisi fungsi untuk menampilkan halaman berdasarkan indeks tab yang dipilih.

```
tabBuilder: (context, index) {
  switch (index) {
    case 0:
      return FeedsPage();
    case 1:
      return SearchPage();
    case 2:
      return SettingsPage();
    default:
      return Center(
        child: Text('Page not found!'),
      );
  }
},
```

Sekarang, buatlah masing-masing halaman dengan menggunakan CupertinoPageScaffold.

**search_page.dart**

```
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Search Page'),
      ),
      child: Center(
        child: Text(
          'Search Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
```

**setting_page.dart**

```
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Setting Page'),
      ),
      child: Center(
        child: Text(
          'Setting Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
```

Sekarang mari ubah FeedsPage dengan menambahkan button. Sesuaikan kode menjadi seperti berikut:

```
class FeedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Feeds Page'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Feeds Page',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            SizedBox(height: 8),
            CupertinoButton.filled(
              child: Text('Select Category'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
```

Kita akan tampilkan action sheet ketika button diklik. Action sheet adalah komponen iOS yang memberikan dua atau lebih pilihan terhadap pengguna. Flutter telah menyediakan fungsi untuk menampilkannya. Tambahkan kode berikut di dalam parameter onPressed.

```
showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: Text('Select Categories'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CategoryPage(
                      selectedCategory: 'Technology'),
                ),
              );
            },
            child: Text('Technology'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CategoryPage(
                      selectedCategory: 'Business'),
                ),
              );
            },
            child: Text('Business'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      CategoryPage(selectedCategory: 'Sport'),
                ),
              );
            },
            child: Text('Sport'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Close'),
          onPressed: () => Navigator.pop(context),
        ),
      );
    });
```

Kode di atas akan eror karena Anda belum memiliki widget CategoryPage. Buat berkas dan halaman baru untuk mengatasi erornya.

```
class CategoryPage extends StatelessWidget {
  final String selectedCategory;
 
  CategoryPage({required this.selectedCategory});
 
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$selectedCategory Page'),
      ),
      child: Center(
        child: Text(
          '$selectedCategory Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
```
Kemudian ubah juga tampilan SettingsPage dengan menampilkan tombol logout.

```
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings Page'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('Log out'),
          onPressed: () {},
        ),
      ),
    );
  }
}
```

Lalu, panggil fungsi showCupertinoDialog() untuk menampilkan CupertinoAlertDialog ketika tombol diklik. Alert Dialog akan menampilkan dialog untuk memperingatkan pengguna atas sebuah situasi. Anda dapat menambahkan aksi terhadap dialog dengan memanfaatkan widget CupertinoDialogAction.

```
showCupertinoDialog(
  context: context,
  builder: (context) {
    return CupertinoAlertDialog(
      title: Text('Are you sure to log out?'),
      actions: [
        CupertinoDialogAction(
          child: Text('No'),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: Text('Yes'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  },
);
```

Referensi
- https://flutter.dev/docs/development/ui/widgets/cupertino.