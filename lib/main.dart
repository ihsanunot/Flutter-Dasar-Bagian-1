import 'package:flutter/material.dart';
import 'widget/screen_pertama.dart';
import 'widget/screen_kedua.dart';
import 'widget/screen_dua_data.dart';
import 'widget/data_layar_kembali.dart';
import 'widget/replace_layar.dart';
import 'widget/layar_lain.dart';

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
        '/layarKeduaData': (context) => ScreenKeduaWithData(
            ModalRoute.of(context)?.settings.arguments as String),
        '/returnDataLayar': (context) => const ReturnScreenData(),
        '/replaceLayar': (context) => const ReplaceLayar(),
        '/layarLainnya': (context) => const LayarLain(),
      },
      // home: Text('jangan pakai home jika sudah pakai initialRoute'),
    );
  }
}
