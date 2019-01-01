import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mysqltest/util/user_credentials.dart';

Future<List> fetchAuthenticatedUser(UserCredentials credentials) async {
  final response = await http.post('http://10.0.2.2/fluttertest/login.php',
      body: {"email": credentials.getEmail, "password": credentials.getPassword});

  if (response.statusCode >= 200) {
    try {
      return json.decode(response.body);
    } catch(e) {
      return [];
    }
  } else {
    return [];
  }
}