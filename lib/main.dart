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
      home: const ScreenPertama(),
    );
  }
}

class ScreenKedua extends StatelessWidget {
  final String pesan;

  const ScreenKedua(this.pesan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen Kedua'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pesan),
              OutlinedButton(
                child: const Text('Kembali'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}

class ScreenPertama extends StatelessWidget {
  const ScreenPertama({Key? key}) : super(key: key);

  final String pesan = 'Hello Halaman Awal!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Utama'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ScreenKedua(pesan)));
          },
        ),
      ),
    );
  }
}
