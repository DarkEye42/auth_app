import 'package:auth_app/features/personalization/screens/splash_screen.dart';
import 'package:auth_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: lightTheme(),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
        fontFamily: 'Poppins',
        disabledColor: AppColors.grey,
        brightness: Brightness.light,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7),
          ),
          titleSmall: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeColor,
                padding: EdgeInsets.symmetric(vertical: 12),
                foregroundColor: AppColors.white,
                fixedSize: Size.fromWidth(double.maxFinite),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))));
  }
}
