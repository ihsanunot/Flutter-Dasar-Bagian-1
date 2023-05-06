# Belajar Flutter Dasar (Stateless dan Stateful)

Flutter Basic untuk Pemula, nanti nya akan saya pelajari dasar nya, dan saya coba pisah ke branch nya.

## Widget

All about Flutter is WIDGET!

Contoh :
- Text itu widget
- Center itu widget

Widget ini konsep nya sama dengan components dari React JS

Jadi, widget ini adalah sekumpulan block-block kode yang digunakan untuk membangun Aplikasi.

> **Perlu diketahui bahwa sebagian besar widget bawaan memiliki pola parent-child, seperti halnya Center yang memiliki child yang artinya di dalam child bisa terdapat widget lagi.**

Pada contoh di atas widget Center dan Button hanya dapat memiliki satu anak atau bisa disebut child. 

Ada pula widget yang dapat memiliki banyak anak atau bisa disebut children, seperti **Row, Column, ListView, GridView, dan semacamnya.**

Contoh :

```
Row(
  children: <Widget>[
    //di dalam children akan berisi banyak widget
  ]
)
```

## StatelessWidget dan StatefulWidget

Widget pada Flutter memiliki dua jenis, yaitu: 

- **StatelessWidget**
- **StatefulWidget**

### Apa itu State?

State adalah data yang ada pada suatu widget. Widget menyimpan data yang nantinya dapat berubah sesuai interaksi pengguna.

state biasanya menjadi suatu properti dari sebuah class. 

Contoh :

```
class ContohWidget extends StatelessWidget{
    final String _judul;
    ...
}
```

***Variabel _judul di atas merupakan contoh pendeklarasian state pada suatu widget.***
---

### StatelessWidget

StatelessWidget adalah widget yang nilai state-nya tidak dapat berubah (immutable) maka widget tersebut lebih bersifat statis dan memiliki interaksi yang terbatas.

Contoh dari stateless widget bawaan Flutter adalah: 
**Text, Icon, IconButton, dan lain-lain.**



### StatefulWidget

Kebalikan dari StatelessWidget, StatefulWidget ialah widget yang state-nya dapat berubah-ubah nilainya, yang berarti StatefulWidget bersifat dinamis dan memiliki interaksi yang tak terbatas.

Properti dalam setiap Class nya harus diperhatikan
Begitu juga huruf koma dan titik koma dari strukturnya
jadi kalau ketik manual pelan pelan biar gak typo dll.

Pada class ContohStateful propertinya hanya berupa parameter ketika memanggil ContohStateful, parameter tersebut tidak wajib ada. 

Sedangkan pada class _ContohStatefulState, properti _dataState merupakan state yang sebenarnya. Kita akan mengubah nilai _dataState.

**Contoh dari stateful widget bawaan Flutter adalah: Checkbox, Radio, Slider, TextField, dan lain-lain.**

---

Referensi :

https://docs.flutter.dev/data-and-backend/state-mgmt/intro

https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html

https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html

---

**Ihsanunot** (flutter_dasar_dcg)

