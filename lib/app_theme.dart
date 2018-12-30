

import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    primaryColor: Color(0xFF245D76),
    hintColor: Colors.white,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
      buttonColor: Color(0xFF245D76),
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: Theme.of(context).textTheme.copyWith(
      subhead: new TextStyle(color: Colors.white),
      body1: new TextStyle(color: Colors.white),
    ),
  );
}