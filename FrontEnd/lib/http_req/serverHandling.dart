import 'dart:convert';
import 'package:http/http.dart' as http;
import 'links.dart';

class ServerHandling {

  Future<bool> checkUser(String email) async {
    final response = await http.post(
      Uri.parse(Links.dataGetUser),
      body: {
        'email': email,
      },
    );
    if (response.body.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future <void> deleteVetAccount(String email) async{
    try {
      final response = await http.post(
        Uri.parse(Links.deleteVetAccount),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Vet account deleted successfully');
      } else {
        // Handle error
        print(response.body);
        print('Failed to delete vet account');
      }
    } catch (error) {
      // Handle error
      print('Error deleting vet account: $error');
    }
  }

  Future <void> deleteUserAccount(String email) async{
    try {
      final response = await http.post(
        Uri.parse(Links.deleteUserAccount),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        // Handle success
        print('User account deleted successfully');
      } else {
        // Handle error
        print(response.body);
        print('Failed to delete user account');
      }
    } catch (error) {
      // Handle error
      print('Error deleting user account: $error');
    }
  }

  Future<List<dynamic>> fetchUserData(String email, String password) async {
    final response = await http.post(
      Uri.parse(Links.dataGetUser),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }



  Future<List<dynamic>> fetchVetData(String email, String password) async {
    final response = await http.post(
      Uri.parse(Links.dataGetVet),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchVetsData() async {
    final response = await http.post(
      Uri.parse(Links.dataGetVets),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> recoverEmail(String email) async {
    final response = await http.post(
      Uri.parse(Links.recoverMailCodeSend),
      body: {
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      String data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> changeUserPassword(String email,String newPassword) async {
    final response = await http.post(
      Uri.parse(Links.changeEmailUser),
      body: {
        'email': email,
        'password': newPassword,
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchAppointments(String email) async {
    final response = await http.post(
        Uri.parse(Links.getAppointment),
        body: {
          'userEmail': email,
        }
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> sendEmail(String email,String heading,String msg) async {
    final response = await http.post(
      Uri.parse(Links.recoverMailCodeSend),
      body: {
        'email': email,
        'msg':msg,

      },
    );

    if (response.statusCode == 200) {
      String data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
