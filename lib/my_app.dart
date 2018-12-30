import 'package:flutter/material.dart';
import 'package:mysqltest/routes/home_page.dart';
import 'package:mysqltest/routes/login_page.dart';
import 'package:mysqltest/routes/signup_page.dart';

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Login': (BuildContext context) => LoginPage(title: 'Log in'),
    '/Signup': (BuildContext context) => SignupPage(title: 'Sign up'),
    '/Home': (BuildContext context) => HomePage(title: 'Dashboard'),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mysql crud test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Mysql crud test'),
      routes: routes,
    );
  }
}