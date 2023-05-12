import 'package:flutter/material.dart';

class ScrollHalaman extends StatelessWidget {
  ScrollHalaman({Key? key}) : super(key: key); //constructor

  final List<int> angkaList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 13]; //data list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //pake map
        children: angkaList.map((angka) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '$angka', // return container nya nanti
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        }).toList(), //mengembalikan fungsi map menjadi objek List
      ),
    );
  }
}
