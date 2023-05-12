# Belajar Dasar Flutter (Bagian 2)

Belajar flutter sederhana basic to basic.

## Expanded & Flexible

**Expanded**

Flutter memiliki widget Expanded yang dapat mengembangkan child dari Row atau Column sesuai dengan ruang yang tersedia.

Cara Pakai :

Cukup membungkus masing-masing child ke dalam Expanded.

```
class Rainbow extends StatelessWidget {
  const Rainbow({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.orange,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.indigo,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}
```

Contoh di atas akan memnempati ruang dengan ukuran yang sama, karena expanded itu flex, dan nilai default nya adalah 1.

Kita bisa mengganti nya jadi 2 atau 3, di salah satu container.

```
Expanded(
  flex: 2,
  child: Container(
    color: Colors.blue,
  ),
),
```

Maka container berwarna biru ini akan menjadi lebih besar dengan perbandingan 2/(1 + 1 + 1 + 1 + 2 + 1 + 1) atau 2/8 dari halaman.

**Flexible**

Flexible digunakan untuk mengatur ukuran widget di dalam Row atau Column secara fleksibel.

Widget Flexible memungkinkan child widget-nya berukuran lebih kecil dibandingkan ukuran ruang yang tersisa.

---

**Referensi:**

* https://api.flutter.dev/flutter/widgets/Expanded-class.html
* https://api.flutter.dev/flutter/widgets/Flexible-class.html

---

**Ihsanunot** (flutter_dasar_dcg)