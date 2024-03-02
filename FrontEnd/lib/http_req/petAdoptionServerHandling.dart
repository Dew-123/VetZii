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