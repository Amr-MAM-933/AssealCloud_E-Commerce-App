import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme = ThemeData(
  primarySwatch: Colors.pink,
  accentColor: Colors.pinkAccent,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  fontFamily: 'Muli',
  inputDecorationTheme: inputDecorationTheme(),
);

AppBarTheme appBarTheme = AppBarTheme(
  centerTitle: true,
  color: Colors.white,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.black87),
  brightness: Brightness.light,
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Color(0xFFCF236B),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);

TextTheme textTheme = TextTheme(
  bodyText1: TextStyle(color: Color(0xFFCF236B)),
  bodyText2: TextStyle(color: Color(0xFF725775)),
);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 6,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 30,
    ),
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
  );
}
