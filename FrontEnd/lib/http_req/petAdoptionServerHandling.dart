import 'dart:convert';
import 'package:http/http.dart' as http;
import 'links.dart';

Future<List<dynamic>> fetchPetsData() async {
  final response = await http.post(
    Uri.parse(Links.dataGetPets),
  );

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> fetchFromDatabase() async {
  try {
    List<dynamic> dataSet = await fetchPetsData();
    return dataSet;
  } catch (e) {
    print("Error fetching pets data: $e");

    return [];
  }
}