import 'package:flutter/material.dart';
import 'package:promotional_task3/utils/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, this.clickButton});

  final String text;
  final void Function()? clickButton;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: primaryColor,
        height: 48,
        minWidth: 327,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: clickButton,
        child: Text(
          text,
          style: const TextStyle(color: white),
        ));
  }
}
