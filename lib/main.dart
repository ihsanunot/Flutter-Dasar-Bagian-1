import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IhsanNunot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello, Koniciwa!'),
        ),
        body: Center(
          child: Text('Hello Mona!'),
        ),
      ),
    );
  }
}

class HalamanPertama extends StatelessWidget {
  const HalamanPertama({Key? key}) : super(key: key);

  // cara mudah tambahin Scaffold param appbar dan title biasa
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title disini bisa juga bisa di tambah dengan widget-widget lain
        title: const Text('Halaman Pertama'),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: const Center(
        child: Text('Hello Flutter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
