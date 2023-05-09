import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ihsanunot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello, Koniciwa!'),
        ),
        body: const ContohTombol(),
      ),
    );
  }
}

double _suara = 0.0; // test icon button

const List<String> list = <String>[
  'Ayana',
  'Mona',
  'Neno',
  'Karina',
  'Fatimah',
  'Ocha'
]; // test value list ke dropdown button

String nilaiDropdown = list.first;

class ContohTombol extends StatefulWidget {
  const ContohTombol({super.key});

  @override
  State<ContohTombol> createState() => _ContohTombolState();
}

class _ContohTombolState extends State<ContohTombol> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('ElevatedButton'),
          ),
          const SizedBox(height: 16),
          TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('Text Button')),
          const SizedBox(height: 16),
          OutlinedButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                debugPrint('Berhasil');
              },
              child: const Text('Outline')),
          const SizedBox(height: 16),
          IconButton(
            icon: const Icon(Icons.volume_up),
            tooltip: 'Naikin volume nya ke 10',
            onPressed: () {
              setState(() {
                _suara += 10;
              });
            },
          ),
          Text('Volume : $_suara'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
