import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  bool _validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _login() async {
    if (_validateAndSave()) {
      final response = await http.post('http://10.0.2.2/fluttertest/login.php',
          body: {"username": _username, "password": _password});

      var dbUser = json.decode(response.body);
      if (dbUser.length != 0) {
        Navigator.of(context).pushReplacementNamed('/Home');
      } else {
        _scaffoldKey.currentState
            .showSnackBar(new SnackBar(content: new Text('No user found!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                ),
                onSaved: (value) => _username = value,
                validator: (value) => (value == "") ? "Cannot be empty" : null,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                onSaved: (value) => _password = value,
                validator: (value) => (value == "") ? "Cannot be empty" : null,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text('Log in'),
                      onPressed: _login,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Haven't created an acount, yet ?",
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushReplacementNamed('/Signup'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Create an account",
                    style: TextStyle(color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
