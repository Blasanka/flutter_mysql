import 'package:flutter/material.dart';
import 'package:mysqltest/routes.dart';
import 'package:mysqltest/routes/login_page.dart';
import 'package:mysqltest/app_theme.dart';

class ThunderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: LoginPage(),
      routes: routes,
    );
  }
}