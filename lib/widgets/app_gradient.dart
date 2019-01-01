import 'package:flutter/material.dart';

final gradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.5, 0.7, 0.9],
    colors: [
      Color(0x5523677A),
      Color(0x9923677A),
      Color(0xEE23677A),
      Color(0xFF23677A),
    ],
  ),
);