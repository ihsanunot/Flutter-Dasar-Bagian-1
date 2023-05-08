# Container di Flutter

Container adalah widget yang digunakan untuk styling, membuat sebuah shape (bentuk) layout pada widget child-nya. 

Contoh:

```
Container(
  color: Colors.blue,
  child: const Text(
    'Hi', 
    style: TextStyle(fontSize: 40),
  ),
),
```

Container ini single children jadi hanya bisa pakai 1 children saja.

Container bisa di taru di dalam Parameter **body Scaffold.**

--- 

### Width & Height

Kita dapat mengatur lebar (width) & tinggi (height)

Contoh:

```
Container(
  color: Colors.blue,
  width: 200,
  height: 100,
  child: const Text(
    'Hi', 
    style: TextStyle(fontSize: 40),
  ),
),
```

---

### Padding & Margin

 **Padding** merupakan jarak antara konten (child) dengan Container, sedangkan **margin** merupakan jarak antara Container dengan bagian luar container.

Contoh:

```
Container(
  color: Colors.blue,
  padding: const EdgeInsets.all(10),
  margin: const EdgeInsets.all(10), 
  child: const Text(
    'Hi', 
    style: TextStyle(fontSize: 40),
  ),
),
```

EdgeInsets.all(10) artinya tiap sisi top bottom left right nya di setting di 10px jarak nya.

---

## Dekorasi Container

Decoration merupakan bagian dari Container untuk styling.

Pada decoration kita dapat menentukan :

* Warna background (solid/gradient color)
* Shadow 
* Border
* Border radius (membulatkan sudut)
* Mengatur shape (bentuk)
* Dan lain-lain.

**Color**

Contoh:
```
Container(
  decoration: BoxDecoration(
    color: Colors.red,
  ),
  child: const Text(
    'Hi', 
    style: TextStyle(fontSize: 40),
  ),
),
```

Untuk menggunakan decoration cukup menambahkan parameter decoration pada Container lalu beri nilai BoxDecoration.

**Shape**

Contoh:
```
Container(
  decoration: BoxDecoration(
    color: Colors.red,
    shape: BoxShape.circle,
  ),
  child: const Text(
    'Hi', 
    style: TextStyle(fontSize: 40),
  ),
),
```

Pada kode di atas kita menambahkan parameter shape dengan nilai BoxShape.circle. 

BoxShape memiliki opsi circle atau rectangle.

**Shadow**

Untuk menambahkan shadow pada Container kita akan menambahkan parameter boxShadow pada BoxDecoration, seperti berikut:

```
Container(
  decoration: BoxDecoration(
    color: Colors.red,
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        offset: Offset(3, 6),
        blurRadius: 10,
      ),
    ],
  ),
  child: const Text(
    'Hi', 
    style: TextStyle(fontSize: 40),
  ),
),
```

**Border**
Border merupakan batas garis dengan content (child).

Contoh :

```
Container(
  decoration: BoxDecoration(
    color: Colors.red,
    border: Border.all(color: Colors.green, width: 3),
  ),
  child: const Text(
    'Hi', 
    style: TextStyle(fontSize: 40),
  ),
),
```

**Padding**
Padding merupakan sebuah widget yang khusus untuk memberikan padding pada suatu widget.

> Padding harus memiliki child

Parameter padding ditambahkan untuk menentukan besaran padding yang diinginkan.

**Center**
Widget Center merupakan sebuah widget yang digunakan untuk membuat suatu widget berada pada posisi tengah.

### Referensi Penting :
* https://api.flutter.dev/flutter/widgets/Container-class.html
* https://api.flutter.dev/flutter/widgets/Padding-class.html

--- 

# Row dan Column

Widget Row merupakan suatu widget yang digunakan untuk membuat widget-widget tersusun berjajar secara horizontal.


## Row
![contoh row aligment](https://user-images.githubusercontent.com/127992374/236868812-699e6a9a-b3f2-45f3-ad6a-ecdb9be14395.jpeg)

```
Row(
  children: <Widget>[
    //di sini berisi widget-widget
  ],
)
```

Untuk membuat widget-widget berjajar secara horizontal kita harus memasukkan widget-widget tersebut ke dalam parameter children. 

Parameter children berisi kumpulan atau list dari widget 
karena kita dapat menyusun beberapa widget sekaligus di dalamnya. 

Jika mengacu pada contoh tombol-tombol di atas kodenya seperti berikut:


```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: const <Widget>[
    Icon(Icons.share),
    Icon(Icons.thumb_up),
    Icon(Icons.thumb_down),
  ],
)
```

Kita menambahkan pula mainAxisAlignment yang merupakan parameter alignment pada Row.

Parameter mainAxisAlignment yang berfungsi untuk mengatur alignment horizontal dari Row (alignment utama).



 Selain itu Row juga memiliki parameter crossAxisAlignment yang berfungsi untuk mengatur alignment secara vertikal. 
 
 Kedua parameter ini juga berlaku sebaliknya untuk widget Column.

---

## Column

Column merupakan suatu widget yang digunakan untuk membuat widget-widget tersusun berjajar secara vertikal.

Contoh :
```
Column(
  children: const <Widget>[
    Text(
      'Sebuah Judul',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
    Text('Lorem ipsum dolor sit amet'),
  ],
)
```

---


Untuk memahami Row, Column, dan bagaimana menyusun layout dengan Flutter secara mendalam, silakan pelajari dokumentasi berikut:


![1](https://user-images.githubusercontent.com/127992374/236868844-407334eb-fdb5-4083-8195-50f8173f2750.png)
![2](https://user-images.githubusercontent.com/127992374/236868871-745518f5-4aa7-4d3f-9166-fb755352ce20.png)


## Referensi:

- https://api.flutter.dev/flutter/widgets/Row-class.html
- https://api.flutter.dev/flutter/widgets/Column-class.html
- https://flutter.dev/docs/development/ui/layout

Terimakasih,
Ihsanunot
