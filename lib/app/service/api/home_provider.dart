import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:lms/app/helper/config.dart';

import '../../data/home_response_model.dart';

class HomeProvider {
  static final client = http.Client();
  static final storage = GetStorage();

  static Future<HomeResponseModel?> getUserData() async {
    String accestoken = await storage.read('accestoken');
    try {
      final response = await client.get(Config.homeUrl, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accestoken',
      });
      print(response.body);
      if (response.statusCode == 200) {
        return homeResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        await storage.remove('accestoken');
        Get.snackbar('Session Habis', 'Silahkan Login Kembali',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        Get.offAllNamed('/login');
        return null;
      } else {
        return null;
      }
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
