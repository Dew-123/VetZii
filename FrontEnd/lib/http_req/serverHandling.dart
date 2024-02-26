import 'dart:convert';
import 'package:http/http.dart' as http;

class ServerHandling {
  Future<List<dynamic>> fetchUserData(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/dataGetUser'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON response body
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load data');
    }
  }
  Future<List<dynamic>> fetchVetData(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/dataGetVet'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON response body
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load data');
    }
  }
}
