import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static Future<List<User>> fetchUsers() async {
    try {
      print('Fetching users from API...');

      final uri = Uri.parse('https://reqres.in/api/users?page=1');
      print('URL: $uri');

      final response = await http.get(uri).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Connection timeout - Please check your internet');
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        if (jsonData.containsKey('data')) {
          final List<dynamic> usersJson = jsonData['data'];
          final users = usersJson.map((json) => User.fromJson(json)).toList();
          print('Successfully loaded ${users.length} users');
          return users;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } on FormatException {
      throw Exception('Invalid data format');
    } catch (e) {
      print('Error in fetchUsers: $e');
      throw Exception(e.toString().replaceAll('Exception: ', ''));
    }
  }
}