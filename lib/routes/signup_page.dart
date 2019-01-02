import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mysqltest/services/signup_service.dart';
import 'package:mysqltest/util/user_credentials.dart';
import 'package:mysqltest/util/validation.dart';
import 'package:mysqltest/widgets/app_background.dart';
import 'package:mysqltest/widgets/app_button.dart';
import 'package:mysqltest/widgets/app_gradient.dart';
import 'package:mysqltest/widgets/app_logo.dart';
import 'package:mysqltest/widgets/app_textfield.dart';
import 'package:mysqltest/widgets/clickable_text.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  BuildContext _context;
  GlobalKey<FormState> _formKey;
  GlobalKey<ScaffoldState> _scaffoldKey;

  UserCredentials _userCred;
  CredentialValidator _validator;

  @override
  initState() {
    _formKey = GlobalKey<FormState>();
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    _validator = CredentialValidator();
    _userCred = UserCredentials();
    super.initState();
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _doSignup() {
    if (_validateAndSave()) {
      signupUser(_userCred).then((value) {
        if (value) {
          Navigator.of(_context)
              .pushReplacementNamed('/Home', result: _userCred.username);
        } else {
          _scaffoldKey.currentState
              .showSnackBar(new SnackBar(content: new Text('Try again!')));
        }
      });
    }
  }

  Widget signupForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              appTextField(
                'Username',
                Icons.person,
                onSave: _userCred.setUsername,
                validate: _validator.validateUsername,
              ),
              appTextField(
                'Email',
                Icons.person,
                inputType: TextInputType.emailAddress,
                onSave: _userCred.setEmail,
                validate: _validator.validateEmail,
              ),
              appTextField(
                'Password',
                Icons.lock,
                isObscure: true,
                onSave: _userCred.setPassword,
                validate: _validator.validatePassword,
              ),
              appButton("Sign up", onPressed: _doSignup),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Do you have an acount ?",
                  textAlign: TextAlign.center,
                ),
              ),
              clickableText("Log in",
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed('/Login')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          backgroundImage,
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
                    signupForm(),
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
