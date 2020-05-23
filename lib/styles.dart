import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle plantInfoLabelText(ThemeData themeData) => TextStyle(
        color: Colors.teal,
        fontFamily: 'Raleway',
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );

  static TextStyle plantInfoValueText(ThemeData themeData) => TextStyle(
        color: Colors.black,
        fontFamily: 'Raleway',
        fontSize: 14,
        fontStyle: FontStyle.normal,
        height: 1.5,
      );

  static TextStyle plantInfoDetailText(ThemeData themeData) => TextStyle(
        color: Colors.black,
        fontFamily: 'Raleway',
        fontSize: 16,
        fontStyle: FontStyle.normal,
        height: 1.5,
      );
}
