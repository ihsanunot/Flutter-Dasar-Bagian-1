# Belajar Dasar Flutter (Bagian 2)

Belajar flutter sederhana basic to basic.

## Input Widget

input pengguna ini berkaitan dengan state yang dapat sering berubah. 
Karena itu umumnya input widget akan ditempatkan di dalam StatefulWidget.

**TextField**

TextField merupakan sebuah widget yang digunakan untuk menerima input berupa teks yang berasal dari keyboard.
Dan ada banyak cara dalam membuat textfied bisa cek di docs langsung atau bisa dari youtube dll.

Parameter :
Parameter **onChanged**

Function :
fungsi **setState()**

Jika Anda tidak ingin mengambil nilai setiap perubahan, tetapi hanya ketika seluruh input sudah selesai di-submit, Anda dapat menggunakan parameter **onSubmitted**.

Cara lain yang bisa kita gunakan adalah dengan TextEditingController. Dengan controller, kita cukup membuat variabel TextEditingController lalu menambahkannya ke widget TextField.

Ketika menggunakan controller, pastikan untuk menghapus controller ketika halaman atau widget sudah tidak digunakan. Ini bertujuan supaya tidak menimbulkan kebocoran memori (memory leak).

Contoh :

```
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

```

**Switch**

Switch merupakan inputan yang mengembalikan nilai boolean true atau false.

**Radio**

Radio merupakan inputan yang digunakan untuk memilih salah satu dari beberapa pilihan dalam suatu kelompok.

**Checkbox**

Checkbox merupakan inputan benar atau salah. 
Checkbox akan berisi centang jika nilainya adalah benar dan kosong jika salah. 

## Saran

Agar mempermudah saya buat folder baru bernama widget yang isi nya adalah widget widget input text switch input, etc.

Lalu tinggal kita import aja widget kita ke lib/main.dart
```
import 'widget/input_text.dart';
import 'widget/switch_input.dart';
import 'widget/radio_input.dart';
import 'widget/checkbox_input.dart';
```

Lalu tinggal taruh saja widget nya :
SingleChildScrollView -> child -> Column -> children[]

didalam childer[] kita akan masukin widget widget nya.


**Referensi :**

* https://api.flutter.dev/flutter/material/ListTile-class.html

* https://api.flutter.dev/flutter/material/AppBar/leading.html

* https://api.flutter.dev/flutter/material/Radio-class.html

* https://api.flutter.dev/flutter/material/Checkbox-class.html

---

**Ihsanunot** (flutter_dasar_dcg)