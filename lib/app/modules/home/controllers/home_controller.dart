import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

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

  void getlocation() async {
    locationData.value = await locationService.getCurrentLocation();
    address.value = await locationService.getAdrres();
  }

  void initLocationService() async {
    await locationService.init();
  }

  @override
  void onInit() {
    getuserData();
    initLocationService();
    super.onInit();
    getlocation();
  }
}
