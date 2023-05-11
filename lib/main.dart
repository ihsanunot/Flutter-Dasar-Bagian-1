import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Gambar',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const FotoGambar(),
    );
  }
}

class FotoGambar extends StatelessWidget {
  const FotoGambar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Gambar'),
        ),
        body: Column(
          children: [
            Image.network(
              'https://picsum.photos/200/300',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 30),
            Image.asset(
              "images/android.png",
              width: 200,
              height: 200,
            ),
          ],
        ));
  }
}

// route nya url/ lokasi aset pakai string