import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:lms/app/helper/config.dart';

import '../../data/list_siswa_response.dart';

class AbsenProvider {
  static final client = http.Client();
  static final storage = GetStorage();
  static String accestoken = storage.read('accestoken');

  static Future<String> checkIn(
    String id,
    Map<String, String> body,
    XFile img,
  ) async {
    try {
      var imgFile = await http.MultipartFile.fromPath('image', img.path);
      var request =
          http.MultipartRequest("POST", Uri.parse(Config.checkIn + id))
            ..headers.addAll({
              'Content-Type': 'multipart/form-data',
              'Accept': 'application/json',
              'Authorization': 'Bearer $accestoken',
            })
            ..fields.addAll(body)
            ..files.add(imgFile);
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final responseJson = json.decode(responseData);

      if (response.statusCode == 200) {
        return 'success';
      } else {
        return responseJson['message'];
      }
    } catch (e, s) {
      print(e);
      print(s);
      return 'failed';
    }
  }

  static Future<ListSiswaResponseModel?> getListSiswa(String id) async {
    String accestoken = await storage.read('accestoken');
    try {
      final response =
          await client.get(Uri.parse(Config.getListSiswa + id), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accestoken',
      });

      if (response.statusCode == 200) {
        return listSiswaResponseModelFromJson(response.body);
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
