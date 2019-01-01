import 'package:flutter/material.dart';

Widget appButton(String buttonName, {Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: RaisedButton(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(child: Text(buttonName)),
          ),
        ],
      ),
      onPressed: onPressed,
    ),
  );
}