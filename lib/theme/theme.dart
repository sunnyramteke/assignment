import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    //scaffoldBackgroundColor: Colors.grey,
    //primaryColor: Colors.white,
    primaryColorDark: Colors.black,
    unselectedWidgetColor: Colors.grey,
    //primaryColorLight: Colors.blue,
    colorScheme: const ColorScheme.light(),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff0a0e21),
    scaffoldBackgroundColor: const Color(0xff0a0e21),
    primaryColorDark: const Color(0xFFEB1555),
    colorScheme: const ColorScheme.dark(),
    primaryColorLight: const Color(0xff1d1e33),
  );
}
