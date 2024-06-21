import 'package:flutter/material.dart';

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
          SizedBox(
            width: 8,
          ),
          Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 79, 121, 192),
              ),
              child: Icon(
                iconss,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
