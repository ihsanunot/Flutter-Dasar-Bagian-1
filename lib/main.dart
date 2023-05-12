import 'package:flutter/material.dart';
// import 'widget/listview_basic.dart';
// import 'widget/listview_dinamik.dart';
// import 'widget/listview_builder.dart';
import 'widget/listview_separator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanded & Flexible',
      theme: ThemeData(
        fontFamily: 'Oswald', // custom font
        primaryColor: Colors.blue,
      ),
      home: const ListViewSeparator(), // import widget ListView.builder
    );
  }
}
