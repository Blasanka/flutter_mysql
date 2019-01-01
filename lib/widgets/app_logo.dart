import 'package:flutter/material.dart';

Widget buildLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Text(
        "Thunder",
        style: TextStyle(fontSize: 50.0),
      ),
      Text(".com"),
    ],
  );
}