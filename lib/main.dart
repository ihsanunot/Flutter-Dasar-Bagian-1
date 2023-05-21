import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Screen',
      theme: ThemeData(
        fontFamily: 'Oswald',
        primaryColor: Colors.blue,
      ),
      home: const Text('Isi disini'),
    );
  }
}
