import 'package:flutter/material.dart';
import 'package:promotional_task3/utils/constants/colors.dart';
import 'package:promotional_task3/utils/constants/size.dart';

class OverlayPage extends StatelessWidget {
  const OverlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      
      ],
    );
  }
}

class Create extends StatelessWidget {
  const Create({super.key, required this.text, required this.iconss});

  final String text;
  final IconData iconss;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(text),
         const SizedBox(
            width: AppSize.spaceBfrFields
          ),
          Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color:primaryColor,
              ),
              child: Icon(
                iconss,
                color: white,
              ))
        ],
      ),
    );
  }
}
