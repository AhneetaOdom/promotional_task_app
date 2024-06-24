import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, this.clickButton});

  final String text;
  final void Function()? clickButton;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: const Color.fromARGB(255, 79, 121, 192),
        height: 48,
        minWidth: 327,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: clickButton,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
