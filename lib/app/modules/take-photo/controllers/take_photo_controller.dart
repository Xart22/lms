import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';

import '../../../service/location_service.dart';
import '../views/preview.dart';

class TakePhotoController extends GetxController {
  late CameraController cameraController;
  var isLoading = true.obs;
  final locationService = Get.find<LocationService>();
  var addres = ''.obs;
  var imageFile = XFile('').obs;

  Future<void> cameraInit() async {
    var cameras = await availableCameras();
    cameraController = CameraController(cameras[1], ResolutionPreset.max);

    await cameraController
        .initialize()
        .then((value) => isLoading.value = false);
  }

  void takePicture() async {
    if (!cameraController.value.isInitialized) {
      return null;
    }
    final photo = await cameraController.takePicture();
    isLoading.value = true;
    await locationService.getCurrentLocation();
    cameraController.setFlashMode(FlashMode.off);
    Image image = decodeImage(File(photo.path).readAsBytesSync())!;
    File(photo.path).writeAsBytesSync(encodePng(image));
    Get.to(() => PreviewImage(
              path: photo,
            ))!
        .then((value) {
      value ? Get.back(result: photo) : null;
      value == false ? File(photo.path).delete() : null;
      isLoading.value = false;
    });
  }

  getAddres() async {
    await locationService.getAdrres().then((value) {
      addres.value = value ?? '';
    });
  }

  @override
  void onInit() {
    cameraInit();
    super.onInit();
    getAddres();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
