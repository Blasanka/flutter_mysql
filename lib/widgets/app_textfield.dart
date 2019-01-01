import 'package:flutter/material.dart';

Widget appTextField(String labelText, IconData icon, {isObscure = false, Function onSave, Function validate}) {
  return TextFormField(
    obscureText: isObscure,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(icon, color: Colors.white),
    ),
    onSaved: onSave,
    validator: validate,
  );
}