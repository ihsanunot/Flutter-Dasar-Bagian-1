import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ini constructor
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
          child: BiggerText(text: 'Hello Mona!'),
        ),
      ),
    );
  }
}

// Contoh Statefull

class BiggerText extends StatefulWidget {
  final String text; // parameter widget

  const BiggerText({Key? key, required this.text}) : super(key: key);

  @override
  _BiggerTextState createState() =>
      _BiggerTextState(); // _BiggerTextState createState() => _BiggerTextState(); nanti buat dibawah nya lagi class nya
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize =
      16.0; // // ini state dari Widget (state yg asli nya ada data)

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
            child: const Text('Perbesar!'),
            onPressed: () {
              setState(() {
                _textSize = 32.0;
              });
            })
      ],
    );
  }
}

// Contoh Stateless bisa dipanggil "di Center(child:)"
class Heading extends StatelessWidget {
  final String text;

  const Heading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
