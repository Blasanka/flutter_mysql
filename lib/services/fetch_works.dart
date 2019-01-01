import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchData() async {
  final response = await http.get('http://10.0.2.2/fluttertest/myworks.php');
  return json.decode(response.body);
}