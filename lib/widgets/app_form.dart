import 'package:flutter/material.dart';
import 'package:mysqltest/util/user_credentials.dart';
import 'package:mysqltest/util/validation.dart';
import 'package:mysqltest/widgets/app_button.dart';
import 'package:mysqltest/widgets/app_textfield.dart';
import 'package:mysqltest/widgets/clickable_text.dart';

class AppForm extends StatefulWidget {
  AppForm({this.child, this.props});

  final Widget child;
  UserCredentials props;

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  GlobalKey<FormState> _formKey;

  CredentialValidator _validator;

  @override
  initState() {
    _formKey = GlobalKey<FormState>();
    _validator = CredentialValidator();
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            (widget.child != null) ? widget.child : SizedBox(),
            appTextField('Email', Icons.person, onSave: widget.props.setEmail, validate: _validator.validateEmail),
            appTextField('Password', Icons.lock, isObscure: true, onSave: widget.props.setPassword, validate: _validator.validatePassword),
            appButton('Login', onPressed: _validateAndSave),
            clickableText("Forgot your password?", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
