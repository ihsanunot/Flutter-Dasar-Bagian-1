# SliverList & SliverGrid

![ss1](https://github.com/ihsanunot/Flutter-Dasar-Bagian-1/assets/127992374/90b13b89-422a-43f7-bf23-2cfb7da58e9f)


Kita juga bisa memanfaatkan widget Sliver untuk membuat efek scrolling.

* Implementasi SliverList
* Implementasi SliverGrid

Mari kita test dengan projek baru, terus buat file academy.dart yang isi nya :

```
class Academy {
  final String title;
  final String description;
 
  Academy({
    required this.title,
    required this.description,
  });
}
```

Kali ini kita pakai Data Statis Lagi jadi bisa anda salin dulu data dibawah ini (agak panjang ini) taruh di bawah class academy.

```
/*  -- DATA STATIS -- */

final List<Academy> androidPaths = [
  Academy(
    title: 'Memulai Pemrograman Dengan Kotlin',
    description:
        'Langkah pertama untuk menjadi seorang Android Developer dengan mempelajari bahasa yang direkomendasikan oleh Google.',
  ),
  Academy(
    title: 'Belajar Membuat Aplikasi Android untuk Pemula',
    description:
        'Buat aplikasi pertamamu dengan memahami dasar-dasar membuat tampilan dan logika aplikasi.',
  ),
  Academy(
    title: 'Belajar Fundamental Aplikasi Android',
    description:
        'Perdalam keahlianmu di dunia pemrograman Android dengan mempelajari cara membuat aplikasi yang dapat mengambil data dari server dan menyimpannya ke dalam database.',
  ),
  Academy(
    title: 'Belajar Pengembangan Aplikasi Android Intermediate',
    description:
        'Perdalam keahlian untuk menjadi Associate Android Developer yang fokus pada pengalaman pengguna yang lebih baik.',
  ),
  Academy(
    title: 'Belajar Prinsip Pemrograman SOLID',
    description:
        'Memperkaya modal menjadi Android Developer dengan belajar prinsip dasar SOLID.',
  ),
  Academy(
    title: 'Menjadi Android Developer Expert',
    description:
        'Jadilah developer expert dengan belajar berbagai macam skill yang diperlukan di dunia industri, termasuk performa dan keamanan aplikasi.',
  ),
];

final List<Academy> iosPaths = [
  Academy(
    title: 'Memulai Pemrograman Dengan Swift',
    description:
        'Langkah pertama untuk menjadi seorang iOS Developer dengan mempelajari bahasa yang direkomendasikan oleh Apple.Inc.',
  ),
  Academy(
    title: 'Belajar Membuat Aplikasi iOS untuk Pemula',
    description:
        'Buat aplikasi iOS pertamamu dengan memahami dasar-dasar membuat tampilan dan logika aplikasi.',
  ),
  Academy(
    title: 'Belajar Fundamental Aplikasi iOS',
    description:
        'Perdalam keahlianmu di dunia pemrograman iOS dengan mempelajari cara membuat aplikasi yang dapat mengambil data dari server dan menyimpannya ke dalam database.',
  ),
  Academy(
    title: 'Belajar Prinsip Pemrograman SOLID',
    description:
        'Memperkaya modal menjadi iOS Developer dengan belajar prinsip dasar SOLID.',
  ),
  Academy(
    title: 'Menjadi iOS Developer Expert',
    description:
        'Jadilah iOS Developer Expert dengan belajar berbagai macam skill yang diperlukan di dunia industri.',
  ),
];

final List<Academy> flutterPaths = [
  Academy(
    title: 'Memulai Pemrograman Dengan Dart',
    description:
        'Langkah pertama untuk menjadi seorang Flutter Developer dengan mempelajari bahasa Dart yang digunakan untuk mengembangkan aplikasi dengan Flutter.',
  ),
  Academy(
    title: 'Belajar Membuat Aplikasi Flutter untuk Pemula',
    description:
        'Buat aplikasi pertamamu dengan mengenal Flutter dan memahami dasar-dasar membangun tampilan Flutter dengan widget.',
  ),
  Academy(
    title: 'Belajar Fundamental Aplikasi Flutter',
    description:
        'Perdalam keahlianmu dalam mengembangkan aplikasi menggunakan Flutter dengan mempelajari cara membuat aplikasi yang dapat mengambil data dari server dan menyimpannya ke dalam database.',
  ),
  Academy(
    title: 'Belajar Prinsip Pemrograman SOLID',
    description:
        'Mendalami Object-Oriented Programming (OOP) dengan belajar prinsip dasar SOLID.',
  ),
  Academy(
    title: 'Menjadi Flutter Developer Expert',
    description:
        'Pelajari best practice seperti clean architecture, TDD, modularisasi, continuous integration, performance, dan security dalam mengembangkan aplikasi Flutter.',
  ),
];

final List<Academy> webPaths = [
  Academy(
    title: 'Belajar Dasar Pemrograman Web',
    description:
        'Belajar dasar adalah langkah yang tidak boleh dilewatkan untuk mahir di bidang apa pun. Di sini, Anda akan belajar dasar dari HTML, CSS dan JavaScript. sebagai 3 pilar pembentuk website.',
  ),
  Academy(
    title: 'Belajar Membuat Front-End Web untuk Pemula',
    description:
        'Pelajari lebih dalam JavaScript, DOM manipulation, dan web storage untuk meningkatkan fungsionalitas dan interaktifitas pada website Anda.',
  ),
  Academy(
    title: 'Belajar Fundamental Front-End Web Development',
    description:
        'Agar pengalaman mengembangkan website lebih seru, gunakanlah tools modern seperti Webpack. Selain itu, Anda akan belajar bagaimana menampilkan data dari server sehingga webmu bisa menampilkan data yang dinamis.',
  ),
  Academy(
    title: 'Menjadi Front-End Web Developer Expert',
    description:
        'Menjadi seorang expert adalah impian setiap developer. Untuk itu, Anda perlu mempelajari prinsip dan materi expert seperti testing dan performance di sini. Di langkah ini juga, Anda diarahkan untuk membuat web aplikasi yang modern.',
  ),
];

```

Siapkan widget untuk menyimpan halaman utama dengan membuat berkas baru bernama **learning_path_page.dart**

```
/// learning_path_page.dart
class LearningPathPage extends StatelessWidget {
  const LearningPathPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ihsan Learning Paths'),
      ),
      body: const LearningPathList(),
    );
  }
}
```

Lalu Tempatkan LearningPathList ke dalam widget utama MyApp.

```
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LearningPathPage(),
    );
  }
}
```

Jangan lupa untuk menambahkan LearningPathList ke dalam widget utama MyApp

LearningPathList adalah widget yang menampilkan data learning path dan kelas

```
class LearningPathList extends StatelessWidget {
  const LearningPathList({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [],
    );
  }
}
```

Di sini kita akan menggunakan widget CustomScrollView. Widget ini adalah widget ScrollView yang membuat efek custom scroll dengan Slivers. 

Widget ini memiliki parameter slivers yang mirip dengan children. Isi parameter tersebut dengan widget sliver yang ingin ditampilkan.

Sebelum itu, mari kita buat dulu widget yang berperan sebagai header ketika scrolling. 

Di dalam LearningPathList tambahkan fungsi yang akan mengembalikan widget SliverPersistentHeader.

```
class LearningPathList extends StatelessWidget {
  SliverPersistentHeader _header(String text) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: null,
    );
  }
 
  @override
  Widget build(BuildContext context) {...}
}
```

### Delegate
Parameter delegate harus diisi dengan kelas SliverPersistentHeaderDelegate. Karena kelas ini merupakan abstract class, maka kita perlu membuat kelas implementasinya terlebih dulu.

```
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
 
}
```

Kode akan eror karena ada beberapa implementasi yang perlu ditambahkan. Arahkan kursor ke nama kelas lalu ketik shortcut Alt + Enter (Ctrl + . pada Visual Studio Code), kemudian pilih Create 4 missing override(s).

Sekarang ada beberapa method yang perlu kita isi. Tambahkan dulu beberapa variabel dan buat constructor-nya.

```
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
 
  final double minHeight;
  final double maxHeight;
  final Widget child;
 
  ...
}
```

Tiga properti ini antara lain ukuran minimal dan maksimal ketika widget mengembang serta widget yang ingin ditampilkan.

Tambahkan ketiga properti tersebut ke dalam override method

```
@override
Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  return child;
}
 
@override
double get maxExtent => maxHeight;
 
 
@override
double get minExtent => minHeight;
```

Method terakhir berisi apakah widget perlu dibangun ulang. Karena itu lakukan pengecekan apakah terdapat perubahan properti.

```
@override
bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
  return maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      child != oldDelegate.child;
}
```

Setelah kelas SliverAppBarDelegate siap, kita bisa menggunakannya untuk mengisi parameter delegate pada header.

```
delegate: SliverAppBarDelegate(
  minHeight: 60,
  maxHeight: 150,
  child: Container(
    color: Colors.lightBlue,
    child: Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  ),
),
```

Selanjutnya tambahkan header ke dalam **CustomScrollView**

```
@override
Widget build(BuildContext context) {
  return CustomScrollView(
    slivers: [
      _header('Android Developer'),
    ],
  );
}
```
Kemudian di bawah header merupakan daftar item yang ingin ditampilkan. Parameter slivers hanya boleh diisi dengan widget sliver. Karena itulah kita akan gunakan widget SliverListuntuk menampilkan list.

```
slivers: [
  _header('Android Developer'),
  SliverList(
    delegate: SliverChildListDelegate(
      androidPaths.map(_buildTile).toList(),
    ),
  ),
],
```
Tambahkan metode _buildTile()untuk menampilkan setiap item ke dalam ListTile.

```
Widget _buildTile(Academy academy) {
    return ListTile(
      title: Text(academy.title),
      subtitle: Text(
        academy.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
    );
  }
```
Untuk penggunaan SliverGrid juga mirip. Anda perlu menentukan jumlah grid yang ingin ditampilkan dalam satu baris dan data yang ingin ditampilkan.

```
slivers: [
  ...
 
  _header('Multi-Platform App Developer'),
  SliverGrid.count(
    crossAxisCount: 2,
    children: flutterPaths.map(_buildTile).toList(),
  ),
],
```
Lakukan juga langkah yang sama pada kategori learning path lainnya. Sehingga kode method build()Anda akan seperti berikut:

```
@override
Widget build(BuildContext context) {
  return CustomScrollView(
    slivers: [
      _header('Android Developer'),
      SliverList(
        delegate: SliverChildListDelegate(
          androidPaths.map(_buildTile).toList(),
        ),
      ),
      _header('iOS Developer'),
      SliverList(
        delegate: SliverChildListDelegate(
          iosPaths.map(_buildTile).toList(),
        ),
      ),
      _header('Multi-Platform App Developer'),
      SliverGrid.count(
        crossAxisCount: 2,
        children: flutterPaths.map(_buildTile).toList(),
      ),
      _header('Front-End Web Developer'),
      SliverGrid.count(
        crossAxisCount: 2,
        children: webPaths.map(_buildTile).toList(),
      )
    ],
  );
}
```

Done, tinggal running aja

**Ihsanunot** Flutter 3.0




