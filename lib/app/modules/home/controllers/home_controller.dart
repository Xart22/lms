import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/home_response_model.dart';
import '../../../service/api/home_provider.dart';
import '../../../service/location_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var userData = HomeResponseModel(
    success: false,
    data: null,
  ).obs;
  LocationService locationService = Get.find<LocationService>();
  var locationData = Position(
          longitude: 0,
          latitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0)
      .obs;
  var address = ''.obs;

  void getuserData() async {
    try {
      final data = await HomeProvider.getUserData();
      if (data != null) {
        userData.value = data;
      }
    } finally {
      isLoading.value = false;
    }
  }

  String formatTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  void getlocation() async {
    locationData.value = await locationService.getCurrentLocation();
    address.value = await locationService.getAdrres();
  }

  void initLocationService() async {
    await locationService.init();
  }

  void modalLogout() {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xff292C2A),
        title: const Text('Logout', style: TextStyle(color: Colors.red)),
        content: const Text('Apakah anda yakin ingin logout?',
            style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff292C2A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.red),
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('Batal', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              Get.back();
              Get.offAllNamed('/login');
            },
            child: const Text('Ya', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    getuserData();
    initLocationService();
    super.onInit();
    getlocation();
  }
}
