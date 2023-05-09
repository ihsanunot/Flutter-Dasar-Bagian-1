# Belajar Dasar Flutter (Bagian 2)

Belajar flutter sederhana basic to basic.


## Button

Widget button ini adalah widget yang dapat menerima trigger sentuhan atau dapat melakukan 
suatu fungsi ketika disentuh.

**ElevatedButton**

ElevatedButton memiliki 2 parameter yaitu onPressed dan child.

**TextButton**

TextButton merupakan widget button yang memiliki tampilan yang polos selayaknya Text. TextButton umumnya digunakan pada toolbars, dialog, atau bersama komponen button lain.

**OutlinedButton**

OutlinedButton umumnya digunakan untuk tombol atau aksi yang penting, tetapi bukan aksi utama dalam aplikasi.

**IconButton**

IconButton merupakan widget button dengan icon. Tak seperti widget tombol lainnya, widget IconButton ini tidak memiliki child.

IconButton tidak menggunakan child untuk isi (content) melainkan menggunakan parameter icon dan tooltip (penunjuk) untuk memberikan hint pada tombol.

**DropdownButton**

DropdownButton merupakan tombol yang saat diklik, akan muncul pop-up daftar beberapa item yang dapat kita pilih salah satu.

> Yang dropdown saya coba contoh nya ada di dalam folder contoh_dropdown
Sisa nya langsung ada di main.dart nya


**Disini saya pakai :**

> const SizedBox(height: 16)

Untuk mengatur jarak antar tombol nya.


**Referensi :**
* https://flutter.dev/docs/development/ui/widgets/material#Buttons

---

**Ihsanunot** (flutter_dasar_dcg)