import 'package:flutter/material.dart';
import 'package:life_graph/util/app_color.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: 'GowunDodum',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.neutral[300],
      surfaceTintColor: AppColor.neutral[300],
      elevation: 2,
      titleTextStyle: TextStyle(
            fontFamily: 'GowunDodum',
            fontWeight: FontWeight.bold,
            color: AppColor.neutral[900],
          ),
    ),
    scaffoldBackgroundColor: AppColor.neutral[200],
  );
}
