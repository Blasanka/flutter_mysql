import 'package:flutter/material.dart';
import 'package:mysqltest/app_theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      theme: appTheme(context),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "Thunder",
          style: TextStyle(fontSize: 50.0),
        ),
        Text(".com"),
      ],
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Username",
                prefixIcon: Icon(Icons.person, color: Colors.white),
              ),
            ),
            TextFormField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: RaisedButton(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(child: Text('Login')),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            InkWell(onTap: () {}, child: Text("Forgot your password?")),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(onTap: () {}, child: Text("Create one")),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return ListView(
      itemExtent: MediaQuery.of(context).size.height - 30,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 15.0),
            _buildLogo(),
            _buildForm(),
            _buildCreateAccount(),
          ],
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
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
      ),
      child: _buildContent(),
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
          _buildGradient(),
        ],
      ),
    );
  }
}

//https://stackoverflow.com/questions/48424076/how-to-set-a-different-theme-for-a-screen
//https://ericwindmill.com/posts/inherited_widget/
//
////expandable
//https://stackoverflow.com/questions/50530152/how-to-create-expandable-listview-in-flutter