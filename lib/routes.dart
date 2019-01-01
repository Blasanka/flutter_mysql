
import 'package:flutter/material.dart';
import 'package:mysqltest/routes/home_page.dart';
import 'package:mysqltest/routes/login_page.dart';
import 'package:mysqltest/routes/signup_page.dart';

final routes = <String, WidgetBuilder>{
  '/Login': (BuildContext context) => LoginPage(),
  '/Signup': (BuildContext context) => SignupPage(title: 'Sign up'),
  '/Home': (BuildContext context) => HomePage(title: 'Dashboard'),
};