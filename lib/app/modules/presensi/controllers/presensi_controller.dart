import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:camera/camera.dart';
import 'package:lms/app/data/list_siswa_response.dart';
import 'package:lms/app/service/api/absen_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/detail_mapel_response_model.dart';
import '../../../data/home_response_model.dart';
import '../../../service/api/mapel_provider.dart';
import '../../../service/location_service.dart';

class PresensiController extends GetxController {
  SubjectElement mapel = Get.arguments;
  var now = DateTime(2021, 1, 1, 0, 0, 0).obs;
  var imageFile = XFile('').obs;
  var isLoading = false.obs;
  LocationService locationService = Get.find<LocationService>();
  var mapelData = DetailMapelResponseModel(
    success: null,
    data: null,
  ).obs;
  var btnType = 'Masuk'.obs;
  var presensiText = 'Belum Presensi'.obs;
  var listSiswa = <Siswa>[].obs;
  TextEditingController namaSiswaController = TextEditingController();
  Siswa? siswaSelected;

  void getListSiswa() async {
    await AbsenProvider.getListSiswa(mapel.id.toString()).then((value) {
      if (value != null) {
        listSiswa.value = value.data;
      }
    });
  }

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

  void getDetailMapel() async {
    try {
      final data = await MapelProvider.getDetailMapel(mapel.id.toString());
      if (data != null) {
        mapelData.value = data;
        mapelData.value.data?.statusAbsen == null
            ? btnType.value = 'Masuk'
            : btnType.value = 'Selesai';
        mapelData.value.data?.statusAbsen == null
            ? presensiText.value = 'Belum Presensi'
            : presensiText.value =
                mapelData.value.data?.statusAbsen!.datetime.toString() ??
                    'Belum Presensi';
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> launchInBrowser(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void presensi(String type, String? userId) async {
    isLoading.value = true;
    await locationService.getCurrentLocation();
    if (locationService.locationData.value.isMocked) {
      Get.snackbar('Failed', 'Tidak dapat melakukan presensi di lokasi palsu',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    var address = await locationService.getAdrres();
    await AbsenProvider.checkIn(
            mapel.id.toString(),
            {
              'latitude':
                  locationService.locationData.value.latitude.toString(),
              'longitude':
                  locationService.locationData.value.longitude.toString(),
              'location': address,
              'user_id': userId ?? '',
            },
            imageFile.value)
        .then((value) {
      if (value == 'success') {
        Get.snackbar('Success', 'Berhasil melakukan presensi',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        getDetailMapel();
        isLoading.value = false;
        imageFile = XFile('').obs;
      } else {
        isLoading.value = false;
        Get.snackbar('Failed', 'Gagal melakukan presensi',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    });
  }

  void presensiModalHelp() {
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
          title: const Center(child: Text('Bantu Presensi Siswa')),
          content: Obx(() => SizedBox(
                height: imageFile.value.path == '' ? 300 : 500,
                child: Column(
                  children: [
                    const Text('Nama'),
                    const SizedBox(height: 10),
                    DropdownSearch<Siswa>(
                      asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                      ),
                      itemAsString: (Siswa u) => u.name,
                      onChanged: (Siswa? data) {
                        siswaSelected = data;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text('Ambil Foto Wajah'),
                    const SizedBox(height: 10),
                    Obx(() => imageFile.value.path == ''
                        ? Container()
                        : SizedBox(
                            height: Get.height * 0.3,
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
                siswaSelected = null;
                imageFile.value.path == ''
                    ? Get.back()
                    : File(imageFile.value.path).delete();
                imageFile = XFile('').obs;
              },
              child: const Text('Batal',
                  style: TextStyle(color: Color(0xFF333365))),
            ),
            TextButton(
              onPressed: () {
                presensi('Masuk', siswaSelected?.id.toString());
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

  void presensiModal(String type) {
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
              },
              child: const Text('Batal',
                  style: TextStyle(color: Color(0xFF333365))),
            ),
            TextButton(
              onPressed: () {
                presensi(type, null);
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

  Widget _customPopupItemBuilderExample2(
      BuildContext context, Siswa item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.identityNumber.toString()),
      ),
    );
  }

  Future<List<Siswa>> getData(filter) async {
    return listSiswa
        .where((element) =>
            element.name.toLowerCase().contains(filter.toLowerCase()))
        .toList();
  }

  @override
  void onInit() {
    getDetailMapel();
    getListSiswa();
    startTime();
    super.onInit();
  }
}
