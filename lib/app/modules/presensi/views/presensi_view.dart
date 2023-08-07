import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lms/app/modules/loading.dart';

import 'package:lms/app/modules/presensi/views/topic_view.dart';

import '../controllers/presensi_controller.dart';
import 'package:flutter_html/flutter_html.dart';

class PresensiView extends GetView<PresensiController> {
  const PresensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(controller.mapel.subject!.name,
              style: const TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: Get.width,
                    height: Get.height * 0.24,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 20,
                                ),
                                Obx(() => Text(
                                    controller.formatDate(controller.now.value),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ))),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer,
                                  size: 20,
                                ),
                                Obx(() => Text(
                                    controller.formatTime(controller.now.value),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ))),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Masuk',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        Obx(
                          () => Text(controller.presensiText.value,
                              style: const TextStyle(
                                fontSize: 14,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => controller.btnType.value == 'Masuk'
                                ? TextButton(
                                    onPressed: () {
                                      controller.presensiModal(
                                          controller.btnType.value);
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff069550),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)))),
                                    child: Row(
                                      children: [
                                        controller.btnType.value == 'Masuk'
                                            ? const Text(
                                                'Masuk',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const Text(
                                                'Selesai',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )
                                : Container()),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                controller.presensiModalHelp();
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xff069550),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              child: const Icon(
                                Icons.people,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '  Materi ${controller.mapel.name}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(() => controller.mapelData.value.data?.information == null
                    ? const Text('   Tidak ada materi')
                    : Html(data: controller.mapelData.value.data?.information)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '  Topik :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() =>
                    controller.mapelData.value.data?.topics?.isEmpty ?? true
                        ? const Text('   Tidak ada topik')
                        : Text.rich(
                            TextSpan(children: [
                              for (var i = 0;
                                  i <
                                      controller
                                          .mapelData.value.data!.topics!.length;
                                  i++)
                                TextSpan(
                                  text:
                                      '   ${i + 1}. ${controller.mapelData.value.data!.topics![i].name}\n',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() => TopicView(
                                          topicData: controller.mapelData.value
                                              .data!.topics![i]));
                                    },
                                ),
                            ]),
                          )),
                const Text(
                  '  File :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() =>
                    controller.mapelData.value.data?.files?.isEmpty ?? true
                        ? const Text('   Tidak ada File')
                        : Text.rich(
                            TextSpan(children: [
                              for (var i = 0;
                                  i <
                                      controller
                                          .mapelData.value.data!.files!.length;
                                  i++)
                                TextSpan(
                                  text:
                                      '   ${i + 1}. ${controller.mapelData.value.data!.files![i].name}\n',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      controller.launchInBrowser(
                                          'https://lms.official.biz.id/api/download-file-meeting/${controller.mapelData.value.data!.files![i].id}');
                                    },
                                ),
                            ]),
                          )),
              ],
            ),
          ),
          Obx(() => controller.isLoading.value
              ? const Center(
                  child: Loading(),
                )
              : Container())
        ]));
  }
}
