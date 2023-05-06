# Belajar Flutter Dasar

Flutter Basic untuk Pemula, nanti nya akan saya pelajari dasar nya, dan saya coba pisah ke branch nya.

## Struktur Data:

android/
Folder ini merupakan tempat Anda untuk mengatur konfigurasi untuk aplikasi android. Di dalamnya terdapat file gradle, AndroidManifest, dan lain-lain.

ios/
Sama halnya dengan folder android, hanya saja ini untuk iOS.

build/
Ketika Anda melakukan build project flutter, hasil build akan ada pada folder ini.

lib/
Ini merupakan folder utama ketika Anda mengerjakan project flutter. Seluruh source code flutter Anda akan berada pada folder ini.

test/
Folder ini tempat Anda menyimpan source code testing.

### Bedah Code

> void main() => runApp(MyApp());

main() kode dasar nya untuk menjalankan runApp, runApp akan memanggil MyApp()

*Catatan*

Setiap komponen di dalam Flutter terdiri dari widget. 
Bahkan aplikasi Flutter itu sendiri merupakan sebuah widget.

Pada kode contoh  di atas **(file main.dart)**, kelas MyApp, yang merupakan widget, mengembalikan atau menampilkan widget MaterialApp.

MaterialApp adalah widget bawaan Flutter yang akan menjadi fondasi dari aplikasi

**Use Cases:**

- **MaterialApp** digunakan agar aplikasi bisa menerapkan material design. 
Widget ini mengatur beberapa hal, termasuk tema aplikasi, tampilan utama aplikasi,
rute untuk navigasi antar halaman, dan lain-lain.

- **Scaffold** digunakan mendesain struktur layout dasar yang sesuai dengan material design. 
Dengan Scaffold Anda dapat mengatur App Bar, Floating Action Button, Drawer, dan lain-lain.

Referensi:
https://api.flutter.dev/flutter/material/MaterialApp-class.html
https://api.flutter.dev/flutter/material/Scaffold-class.html
https://api.flutter.dev/flutter/widgets/Center-class.html
https://api.flutter.dev/flutter/widgets/Text-class.html


### Package Manager

- Dart pub biasa nya digunakan untuk package manager di flutter
- package manager sangat PENTING untuk manajemen Versi yang digunakan agar compatibel dan tidak error.
- Biasa nya untuk men-check nya buka aja di file **pubspec.yaml**
- ingat di pubspec.yaml itu penutup biasa pakai **Indentasi** klo indentasi tidak sesuai maka error, jadi pastikan indentasi nya benar agar pub get nya gak error.

**Indentasi(Spasi) untuk pubspec.yaml**
ini sangat penting karena menunjukkan urutan dan blok kode yaml yang dibaca oleh komputer.

Di VSCode tinggal save aja, nanti **pub get** nya akan otomatis dijalankan.

Bisa juga manual, dengan sintaks:

> flutter pub get

**Simbol tanda caret (^) berarti:**
gunakan versi  terbaru yang benar dari versi yang  ditentukan. 
Jika versinya adalah ^0.1.2, berarti kita akan menggunakan versi minimal 0.1.2 dan hingga versi terbaru. 
Oleh karena itu, ketika versi paket saat ini diperbarui, paket yang digunakan adalah versi terbaru.

**Tempat Cari Packages:**
https://pub.dev/  (web official)
https://flutterawesome.com/  (web komunitas)

Ada juga private packages yang biasa nya dibuat sendiri dan di private oleh sang pembuat
atau bisa juga kita bikin packages sendiri tapi private agar tidak di pakai oleh orang lain.

*Contoh:*

```
dependencies:
  plugin1:
    git:
      url: git://github.com/flutter/plugin1.git
```






---
---
**Ihsanunot** (flutter_dasar_dcg)

