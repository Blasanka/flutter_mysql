import 'package:flutter/material.dart';
import 'package:mysqltest/app_theme.dart';
import 'package:mysqltest/routes/login.dart';
//import 'package:mysqltest/my_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: LoginPage(),
    );
  }
}