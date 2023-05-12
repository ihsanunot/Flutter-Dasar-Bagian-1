import 'package:flutter/material.dart';

class TextFieldContoh extends StatefulWidget {
  const TextFieldContoh({Key? key}) : super(key: key);

  @override
  State<TextFieldContoh> createState() => _TextFieldContohState();
}

class _TextFieldContohState extends State<TextFieldContoh> {
  final TextEditingController _controller = TextEditingController();

  final String? _name = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // contoh input text field
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Tulisan nama anda disini...',
            labelText: 'Nama Anda',
          ),
          onChanged: (String value) {
            print('Updated : $value');
          },
        ),
        // contoh tombol
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text('Kirim'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Hai, ${_controller.text}'),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
