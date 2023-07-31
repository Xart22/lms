import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:camera/camera.dart';

import '../../../data/home_response_model.dart';
import '../../../service/location_service.dart';

class PresensiController extends GetxController {
  SubjectElement mapel = Get.arguments;
  var now = DateTime(2021, 1, 1, 0, 0, 0).obs;
  var imageFile = XFile('').obs;
  var isLoading = false.obs;
  var isPresensiMasuk = true.obs;
  LocationService locationService = Get.find<LocationService>();

  String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('EEEE, d MMMM yyyy').format(dateTime);
  }

  String normalDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void startTime() {
    now.value = DateTime.now();
    Future.delayed(const Duration(seconds: 1), () {
      startTime();
    });
  }

  void onTapCamera() async {
    isLoading.value = true;
    await locationService.getCurrentLocation();
    Get.toNamed('/take-photo')?.then((value) {
      value != null ? imageFile.value = value : null;
      isLoading.value = false;
    });
  }

  void presensi(String type) {
    Get.dialog(
      WillPopScope(
        onWillPop: () {
          imageFile.value.path == ''
              ? Get.back()
              : File(imageFile.value.path).delete();
          imageFile.value = XFile('');
          Get.back();
          return Future.value(true);
        },
        child: AlertDialog(
          title: Center(child: Text('Presensi $type')),
          content: Obx(() => SizedBox(
                height: imageFile.value.path == '' ? 150 : 550,
                child: Column(
                  children: [
                    const Text('Ambil Foto Wajah'),
                    const SizedBox(height: 10),
                    Obx(() => imageFile.value.path == ''
                        ? Container()
                        : SizedBox(
                            height: Get.height * 0.46,
                            child: Image.file(
                              File(imageFile.value.path),
                              fit: BoxFit.fill,
                            ),
                          )),
                    SizedBox(
                      width: Get.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF333365),
                          side: const BorderSide(
                              color: Color(0xFF333365), width: 1),
                        ),
                        onPressed: () => onTapCamera(),
                        child: const Text('Ambil Foto',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                        'Catatan : Posisi pengambilan foto dilakukan secara selfie atau mengambil gambar wajah secara jelas.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38)),
                  ],
                ),
              )),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF333365), width: 1),
              ),
              onPressed: () {
                imageFile.value.path == ''
                    ? Get.back()
                    : File(imageFile.value.path).delete();
                imageFile = XFile('').obs;
                Get.back();
              },
              child: const Text('Batal',
                  style: TextStyle(color: Color(0xFF333365))),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF333365),
                side: const BorderSide(color: Color(0xFF333365), width: 1),
              ),
              child: const Text('Kirim', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onInit() {
    startTime();
    super.onInit();
  }
}
