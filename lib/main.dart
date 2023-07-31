import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/service/location_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  var token = await GetStorage().read('accestoken');
  Get.put(LocationService());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LMS",
      initialRoute: token == null ? AppPages.INITIAL : '/home',
      getPages: AppPages.routes,
    ),
  );
}
