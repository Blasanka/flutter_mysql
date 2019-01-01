import 'package:flutter/material.dart';

Widget clickableText(String data, {Function onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(onTap: onTap, child: Text(data)),
  );
}