import 'package:flutter/material.dart';
import 'package:promotional_task3/create_account_page.dart';
import 'package:promotional_task3/home_page.dart';
import 'package:promotional_task3/onboarding_page.dart';
import 'package:promotional_task3/secondary_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home:OnboardingPage(),
   
    );
  }
}
