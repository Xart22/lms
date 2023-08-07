import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lms/app/service/api/tugas_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/tugas_detail_response.dart';
import '../../loading.dart';

class TugasDetailController extends GetxController {
  TextEditingController descController = TextEditingController();
  var tugasDetail = TugasDetailResponseModel(data: null).obs;
  var id = Get.arguments;
  var isLoading = true.obs;
  var filePath = XFile('').obs;
  var descError = ''.obs;

  void getTugasDetail(id) async {
    await TugasProvider.getTugasDetail(id.toString()).then((value) {
      if (value != null) {
        tugasDetail.value = value;
      }
    });
  }

  String formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      filePath.value = XFile(result.files.single.path!);
    } else {
      // User canceled the picker
    }
  }

  void uploadModal() {
    Get.dialog(
      WillPopScope(
        onWillPop: () {
          filePath.value.path == ''
              ? Get.back()
              : File(filePath.value.path).delete();
          filePath.value = XFile('');
          Get.back();
          return Future.value(true);
        },
        child: AlertDialog(
          title: const Center(child: Text('Upload Tugas')),
          content: SizedBox(
            height: 250,
            child: Stack(
              children: [
                Column(
                  children: [
                    const Text('Deskripsi'),
                    const SizedBox(height: 10),
                    Obx(() => TextField(
                          controller: descController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            errorText:
                                descError.value == '' ? null : descError.value,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: descError.value == ''
                                    ? Colors.grey
                                    : Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Masukkan Deskripsi',
                          ),
                        )),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: Get.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF333365),
                          side: const BorderSide(
                              color: Color(0xFF333365), width: 1),
                        ),
                        onPressed: () => pickFile(),
                        child: const Text('Ambil File',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const Text('File max 5MB'),
                    const SizedBox(height: 10),
                    Obx(() => filePath.value.path == ''
                        ? const SizedBox()
                        : Text(filePath.value.name,
                            style: const TextStyle(color: Color(0xFF333365))))
                  ],
                ),
                Obx(() => isLoading.value
                    ? const Center(
                        child: Loading(),
                      )
                    : Container())
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF333365), width: 1),
              ),
              onPressed: () {
                filePath.value.path == ''
                    ? Get.back()
                    : File(filePath.value.path)
                        .delete()
                        .then((value) => Get.back());
                filePath = XFile('').obs;
                descError.value = '';
                descController.text = '';
              },
              child: const Text('Batal',
                  style: TextStyle(color: Color(0xFF333365))),
            ),
            Obx(() => TextButton(
                  onPressed: filePath.value.path == '' && isLoading.value
                      ? null
                      : () {
                          descError.value = '';
                          uploadFile();
                        },
                  style: TextButton.styleFrom(
                    backgroundColor: filePath.value.path == ''
                        ? Colors.grey
                        : const Color(0xFF333365),
                    side: const BorderSide(color: Color(0xFF333365), width: 1),
                  ),
                  child: const Text('Kirim',
                      style: TextStyle(color: Colors.white)),
                )),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  void uploadFile() async {
    isLoading.value = true;
    if (descController.text.isEmpty) {
      descError.value = 'Deskripsi tidak boleh kosong';
    } else {
      await TugasProvider.uploadTugas(id.toString(),
              {"description": descController.text}, filePath.value)
          .then((value) {
        if (value == 'success') {
          Get.back();
          Get.back();
          Get.snackbar('Berhasil', 'Tugas berhasil diupload',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white);
        } else {
          Get.snackbar('Gagal', 'Tugas gagal diupload',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
        isLoading.value = false;
      });
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

  @override
  void onInit() {
    getTugasDetail(id);
    super.onInit();
    isLoading.value = false;
  }
}
