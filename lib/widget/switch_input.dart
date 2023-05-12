import 'package:flutter/material.dart';

class SwitchInput extends StatefulWidget {
  const SwitchInput({Key? key}) : super(key: key);

  @override
  State<SwitchInput> createState() => _SwitchInputState();
}

class _SwitchInputState extends State<SwitchInput> {
  bool lightOn = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Switch(
          value: lightOn,
          onChanged: (bool value) {
            setState(() {
              lightOn = value;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(lightOn ? 'Light On' : 'Light Off'),
                duration: const Duration(seconds: 1),
              ),
            );
          }),
      title: Text(lightOn ? "Turn Off" : "Turn On"),
    );
  }
}
