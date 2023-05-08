# Widget Umum di Flutter

**Scaffold**

Scaffold merupakan sebuah widget yang digunakan untuk membuat tampilan dasar material design.

yang merupakan halaman dasar aplikasi Flutter.

**Widget Umum di Scaffold:**
- AppBar
- Body
- FloatingActionButton

Bisa juga di dalam method build kita panggil Scaffold.
di dalam method build kita bisa panggil Scaffold.

---

**AppBar**

 AppBar merupakan Header (bagian paling atas) aplikasi atau biasa dikenal dengan toolbar.

 Pada AppBar umumnya terdapat **judul dan ActionButton.**

Nah di dalam scaffold kita tambahkan appbar lalu AppBar di dalam AppBar nya masukin title, tapi tidak hanya title saja, kita juga bisa menambahkan beberapa widget lain nya di dalam AppBar.

Contoh :

 ```
return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pertama'),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
    );
 ```

 kode di atas kita tambahin *actions*, kita juga menampilkan menu (Drawer).

 kita juga bisa menambahkan action lagi di bagian kiri AppBar

 * Ingat masih di dalam actions, tapi tambahin colon dan setelah array [] biar gak bingung.


 - Setiap Tombol wajib ada 'onPressed: () {}' nya.

 * *leading hanya dapat menampung satu widget saja.*

 - Secara default, **leading** akan berisi tombol untuk kembali ke halaman sebelumnya atau tombol untuk menu drawer.

 ---

 **Body**

 Body adalah bagian utama dari Scaffold, akan banyak menuliskan kode pada bagian body ini.

 Untuk implementasi body kita akan menambahkan parameter body pada Scaffold.

 Contoh :

 ```
         body: const Center(
          child: Text('Hello Flutter'),
        ),
 ```

 Ingat harus di dalam block Scaffold nya.

 ---

 **FloatingActionButton**

 FloatingActionButton ini merupakan bagian dari Scaffold yang digunakan untuk menampilkan sebuah tombol aksi yang posisinya floating (melayang dan posisinya tetap).

 ### Untuk memahami Scaffold lebih dalam, Check :
 
 * https://api.flutter.dev/flutter/material/Scaffold-class.html

* https://flutter.dev/docs/catalog/samples/Scaffold

---

