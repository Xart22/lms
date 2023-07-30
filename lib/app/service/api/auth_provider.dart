import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:lms/app/helper/config.dart';

class AuthService {
  static final client = http.Client();
  static final storage = GetStorage();
  static String accestoken = storage.read('accestoken');

  static Future<String> login(String email, String password) async {
    try {
      final response = await client.post(
        Config.loginUrl,
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 201) {
        final token = json.decode(response.body)['token'];
        await storage.write('accestoken', token);
        return 'success';
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}
