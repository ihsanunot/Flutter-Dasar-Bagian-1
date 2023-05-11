# Belajar Dasar Flutter (Bagian 2)

Belajar flutter sederhana basic to basic.

## Image

Mari kita coba menampilkan gambar dari internet dan juga project asset.

**Image.network**

Untuk gambar dari internet pakai method ini ;

> Image.network(url)

Contoh :

```
Image.network(
          'https://picsum.photos/200/300',
          width: 200,
          height: 200,),
```

**Image.asset**

Selain melalui internet, kita juga dapat menampilkan gambar yang bersumber dari asset project.

Asset harus di daftarkan di pubspec, Untuk mendaftarkan asset gambar pada project kita harus menambahkannya pada berkas pubspec.yaml.

Pertama kita harus tau dulu ini gambar yang mau di masukkan ber format apa? JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, dan WBMP?

diluar itu Flutter akan memanfaatkan API dari masing-masing platform.

bisa buat dulu folder images nya di folder project.

Contoh mendaftarkan nya (pubspec.yaml):

```
flutter:
  uses-material-design: true
 
  assets:
    - images/android.png
```

Jika ingin menambahkan banyak gambar, kita lansung aja tambahin folder images/ nya ke dalam assets di pubspec nya.

```
flutter:
 
  uses-material-design: true
 
  assets:
    - images/
```

Lalu anda sudah bisa masukin gambar nya

> Image.asset(lokasi_asset)

Referensi:

* https://api.flutter.dev/flutter/widgets/Image-class.html


---

**Ihsanunot** (flutter_dasar_dcg)