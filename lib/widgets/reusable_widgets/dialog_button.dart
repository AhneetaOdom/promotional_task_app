import 'package:flutter/material.dart';
import 'package:promotional_task3/utils/constants/colors.dart';
class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.text, this.onPressed,
  });

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color:white),
      ),
    );
  }
}
