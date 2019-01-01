import 'package:flutter/material.dart';
import 'package:mysqltest/services/login_service.dart';
import 'package:mysqltest/util/user_credentials.dart';
import 'package:mysqltest/util/validation.dart';
import 'package:mysqltest/widgets/app_background.dart';
import 'package:mysqltest/widgets/app_button.dart';
import 'package:mysqltest/widgets/app_gradient.dart';
import 'package:mysqltest/widgets/app_logo.dart';
import 'package:mysqltest/widgets/app_textfield.dart';
import 'package:mysqltest/widgets/clickable_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  void _doLogin() {
    if (_validateAndSave()) {
      fetchAuthenticatedUser(_userCred).then((value) {
        print(value);
        if (value.length == 1) {
          Navigator.of(_context).pushReplacementNamed('/Home');
        } else {
          _scaffoldKey.currentState
              .showSnackBar(new SnackBar(content: new Text('No user found!')));
        }
      });
    }
  }

  Widget _loginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
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
            appButton('Login', onPressed: _doLogin),
            clickableText("Forgot your password?", onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Don't have an account?"),
        clickableText("Create one",
            onTap: () =>
                Navigator.of(_context).pushReplacementNamed('/Signup')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
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
                    _loginForm(),
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
