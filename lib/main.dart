import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nav and Route Screen',
      theme: ThemeData(
        fontFamily: 'Oswald',
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RuteScreenPertama(),
        '/layarKedua': (context) => const RuteScreenKedua(),
        // '/layarKeduaData': (context) => ScreenKeduaWithData(
        //     ModalRoute.of(context)?.settings.arguments as String),
        '/returnDataLayar': (context) => const ReturnScreenData(),
        '/replaceLayar': (context) => const ReplaceLayar(),
        '/layarLainnya': (context) => const LayarLain(),
      },
      // home: Text('jangan pakai home jika sudah pakai initialRoute'),
    );
  }
}

class RuteScreenPertama extends StatelessWidget {
  const RuteScreenPertama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Routing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Screen Pertama'),
              onPressed: () {
                Navigator.pushNamed(context, '/layarKedua');
              },
            ),
            // ElevatedButton(
            //   child: const Text('Navigasi Data'),
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/layarKeduaData');
            //   },
            // ),
            ElevatedButton(
              child: const Text('Mengembalikan data dari Screen lain'),
              onPressed: () async {
                final scaffoldPesan = ScaffoldMessenger.of(context);
                final hasil =
                    await Navigator.pushNamed(context, '/returnDataLayar');
                SnackBar snackBar = SnackBar(content: Text('$hasil'));
                scaffoldPesan.showSnackBar(snackBar);
              },
            ),
            ElevatedButton(
              child: const Text('Replace ke Halaman lain'),
              onPressed: () {
                Navigator.pushNamed(context, '/replaceLayar');
              },
            ),
            ElevatedButton(
              child: const Text('Layar Lainnya'),
              onPressed: () {
                Navigator.pushNamed(context, '/layarLainnya');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RuteScreenKedua extends StatelessWidget {
  const RuteScreenKedua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back Kedua')),
          ],
        ),
      ),
    );
  }
}

class ScreenKeduaWithData extends StatelessWidget {
  final String data;

  const ScreenKeduaWithData(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data),
            ElevatedButton(
              child: const Text('Back Data'),
              onPressed: () {
                Navigator.pushNamed(context, '/layarKeduaData',
                    arguments: 'Hello from First Screen!');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnScreenData extends StatefulWidget {
  const ReturnScreenData({Key? key}) : super(key: key);

  @override
  State<ReturnScreenData> createState() => _ReturnScreenDataState();
}

class _ReturnScreenDataState extends State<ReturnScreenData> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(labelText: 'Ketik Nama Anda'),
              ),
            ),
            ElevatedButton(
              child: const Text('Send'),
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class ReplaceLayar extends StatelessWidget {
  const ReplaceLayar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text('Buka Halaman Lain'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/layarLainnya');
        },
      )),
    );
  }
}

// Layar lain nya dart

class LayarLain extends StatelessWidget {
  const LayarLain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Kembali ke layar utama'),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
