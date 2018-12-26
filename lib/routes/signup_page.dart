import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password, _email;

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _signup() async {
    if (_validateAndSave()) {
      await http.post('http://10.0.2.2/fluttertest/signup.php',
          body: {
            "username": _username,
            "email": _email,
            "password": _password
          });

      // var dbUser = json.decode(response.body);
      // if (dbUser.length != 0) {
      //   Navigator.of(context).pushReplacementNamed('/Home');
      // } else {
      //   _scaffoldKey.currentState
      //       .showSnackBar(new SnackBar(content: new Text('Try again!')));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                ),
                onSaved: (value) => _username = value,
                validator: (String value) =>
                    value == "" ? "Cannot be empty" : null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                onSaved: (value) => _email = value,
                validator: (String value) =>
                    value == "" ? "Cannot be empty" : null,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                onSaved: (value) => _password = value,
                validator: (String value) =>
                    value == "" ? "Cannot be empty" : null,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text('Sign up'),
                      onPressed: () {
 			 _signup();
		      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Do you have an acount ?",
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/Login'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Log in",
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
