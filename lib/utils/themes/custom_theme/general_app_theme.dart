import 'package:flutter/material.dart';
import 'package:promotional_task3/utils/constants/colors.dart';
import 'package:promotional_task3/utils/themes/custom_theme/text_theme.dart';

class TaskAppTheme {
  TaskAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white10,
      textTheme: TaskAppTextTheme.lightTextTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TaskAppTextTheme.darkTextTheme);
}