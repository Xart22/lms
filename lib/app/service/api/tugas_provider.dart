import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:lms/app/helper/config.dart';

import '../../data/tugas_detail_response.dart';
import '../../data/tugas_response_model.dart';

class TugasProvider {
  static final client = http.Client();
  static final storage = GetStorage();
  static String accestoken = storage.read('accestoken');

  static Future<TugasResponseModel?> getTugas() async {
    String accestoken = await storage.read('accestoken');
    try {
      final response = await client.get(Config.tugasUrl, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accestoken',
      });
      if (response.statusCode == 200) {
        return tugasResponseModelFromJson(response.body);
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

  static Future<TugasDetailResponseModel?> getTugasDetail(String id) async {
    String accestoken = await storage.read('accestoken');
    try {
      final response =
          await client.get(Uri.parse(Config.tugasDetailUrl + id), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accestoken',
      });
      if (response.statusCode == 200) {
        return tugasDetailResponseModelFromJson(response.body);
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

  static Future<String> uploadTugas(
    String id,
    Map<String, String> body,
    XFile img,
  ) async {
    try {
      var file = await http.MultipartFile.fromPath('file', img.path);
      var request =
          http.MultipartRequest("POST", Uri.parse(Config.uploadTugasUrl + id))
            ..headers.addAll({
              'Content-Type': 'multipart/form-data',
              'Accept': 'application/json',
              'Authorization': 'Bearer $accestoken',
            })
            ..fields.addAll(body)
            ..files.add(file);
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
}
