import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mysqltest/util/user_credentials.dart';
import 'package:dbcrypt/dbcrypt.dart';

Future<bool> signupUser(UserCredentials credentials) async {
  final response = await http.post('http://10.0.2.2/fluttertest/signup.php', body: {
    "username": credentials.getUsername,
    "email": credentials.getEmail,
    "password": new DBCrypt().hashpw(credentials.getPassword, new DBCrypt().gensalt()),
    "role": "member",
  });

  if (response.statusCode >= 200) {
    return true;
  }
  return false;
}
