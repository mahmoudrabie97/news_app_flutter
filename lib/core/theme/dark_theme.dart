import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
    // backgroundColor: const Color(0xff303736),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff323838),
    colorScheme: ColorScheme.dark(
        primary: Colors.grey[900]!, secondary: Colors.grey[800]!),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff323838),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff323838),
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white)));
