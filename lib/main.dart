import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh FONT',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HurufFont(),
    );
  }
}

class HurufFont extends StatelessWidget {
  const HurufFont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Gambar'),
        ),
        body: Column(
          children: [
            Text(
              'Contoh Isi Text',
              style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 30,
              ),
            ),
          ],
        ));
  }
}

// route nya url/ lokasi aset pakai string