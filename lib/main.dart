import 'package:flutter/material.dart';
// import './widget/expand_pelangi.dart';
import './widget/flexible_expanded.dart';

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
        fontFamily: 'Oswald',
        primaryColor: Colors.blue,
      ),
      home: const ExpandedFlexibleWidget(),
    );
  }
}
