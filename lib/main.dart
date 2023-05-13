import 'package:flutter/material.dart';
// import 'widget/media_query.dart';
// import 'widget/layout_builder.dart';
import 'widget/rensponsive_design.dart';

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
      home: const ResponsivePage(),
    );
  }
}
