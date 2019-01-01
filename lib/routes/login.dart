import 'package:flutter/material.dart';
import 'package:mysqltest/util/user_credentials.dart';
import 'package:mysqltest/widgets/app_form.dart';
import 'package:mysqltest/widgets/app_logo.dart';
import 'package:mysqltest/widgets/clickable_text.dart';

class LoginPage extends StatelessWidget {
  UserCredentials _userCred = UserCredentials();

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

  Widget _buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Don't have an account?"),
        clickableText("Create one", onTap: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: gradient,
            child: ListView(
              itemExtent: MediaQuery.of(context).size.height - 30,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    buildLogo(),
                    AppForm(props: _userCred),
                    _buildCreateAccount(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
