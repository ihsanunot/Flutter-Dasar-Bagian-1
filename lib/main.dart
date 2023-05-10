import 'package:flutter/material.dart';
import 'widget/input_text.dart';
import 'widget/switch_input.dart';
import 'widget/radio_input.dart';
import 'widget/checkbox_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HalamanDepan(),
    );
  }
}

class HalamanDepan extends StatefulWidget {
  const HalamanDepan({Key? key}) : super(key: key);

  @override
  State<HalamanDepan> createState() => _HalamanDepanState();
}

class _HalamanDepanState extends State<HalamanDepan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          // isi bagian body atau input text nya
          children: const <Widget>[
            TextFieldContoh(),
            SizedBox(height: 20),
            SwitchInput(),
            SizedBox(height: 20),
            RadioWidget(),
            SizedBox(height: 20),
            CheckboxWidget(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


//ihsanunot