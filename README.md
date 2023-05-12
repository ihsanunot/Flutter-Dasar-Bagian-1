# Belajar Dasar Flutter (Bagian 2)

Belajar flutter sederhana basic to basic.

## ListView

Widget ini digunakan untuk menampilkan beberapa item dalam bentuk baris atau kolom dan bisa di-scroll.

Cara penggunaan ListView ini mirip dengan Column atau Row di mana Anda memasukkan widget yang ingin disusun sebagai children dari ListView.

```
class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '4',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

**Menampilkan Item Secara Dinamis**

Selain memasukkan widget satu per satu ke dalam children dari ListView, Anda juga dapat menampilkan list secara dinamis. 

Ini sangat berguna ketika Anda memiliki banyak item dengan jumlah yang tidak menentu.
Misalnya kita ingin menampilkan daftar angka dari 1 sampai 10.

> final List<int> numberList = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];



Caranya, masukkan variabel atau list Anda sebagai children lalu panggil **fungsi map()**.

Fungsi map ini berguna untuk memetakan atau mengubah setiap item di dalam list menjadi objek yang kita inginkan.

Fungsi map ini membutuhkan satu buah parameter berupa fungsi atau lambda.

```
class ScrollingScreen extends StatelessWidget {
  final List<int> numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: numberList.map((number) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '$number', // Ditampilkan sesuai item
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
```

Perhatikan di akhir kita perlu mengembalikan fungsi map menjadi objek List lagi dengan fungsi .toList(). Lakukan hot reload pada aplikasi Anda untuk melihat hasil perubahan.

## ListView.builder

ListView.builder lebih cocok digunakan pada ListView dengan jumlah item yang cukup besar. Ini karena Flutter hanya akan merender tampilan item yang terlihat di layar dan tidak me-render seluruh item ListView di awal.

ListView.builder memerlukan dua parameter yaitu itemBuilder dan itemCount. Parameter itemBuilder merupakan fungsi yang mengembalikan widget untuk ditampilkan. Sedangkan itemCount kita isi dengan jumlah seluruh item yang ingin ditampilkan.

**Contoh :**

```
ListView.builder(
  itemCount: numberList.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          '${numberList[index]}',
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  },
),
```

## ListView.separated

ListView.separated akan menampilkan daftar item yang dipisahkan dengan separator. 

Penggunaan ListView.separated mirip dengan builder

yang membedakan adalah terdapat satu parameter tambahan wajib yaitu :

**separatorBuilder yang mengembalikan Widget yang akan berperan sebagai separator.**

Contoh:

```
ListView.separated(
  itemCount: numberList.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          '${numberList[index]}',
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  },
  separatorBuilder: (BuildContext context, int index) {
    return const Divider();
  },
),
```

---

**Referensi:**
https://api.flutter.dev/flutter/widgets/ListView-class.html

---

**Ihsanunot** (flutter_dasar_dcg)