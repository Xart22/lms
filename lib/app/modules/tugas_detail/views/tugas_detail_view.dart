import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lms/app/modules/tugas_detail/views/topic_view.dart';

import '../../loading.dart';
import '../controllers/tugas_detail_controller.dart';

class TugasDetailView extends GetView<TugasDetailController> {
  const TugasDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Obx(() =>
              Text("Tugas ${controller.tugasDetail.value.data?.name ?? ''}")),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                      controller.tugasDetail.value.data?.name.capitalize ?? '',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  Obx(() => Text(
                        controller.tugasDetail.value.data?.description ?? '',
                      )),
                  const SizedBox(height: 10),
                  const Text(
                    'Topik :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() =>
                      controller.tugasDetail.value.data?.topics?.isEmpty ?? true
                          ? const Text('Tidak ada topik')
                          : Text.rich(
                              TextSpan(children: [
                                for (var i = 0;
                                    i <
                                        controller.tugasDetail.value.data!
                                            .topics!.length;
                                    i++)
                                  TextSpan(
                                    text:
                                        '   ${i + 1}. ${controller.tugasDetail.value.data!.topics![i].name}\n',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(() => TopicView(
                                              topicData: controller.tugasDetail
                                                  .value.data!.topics![i],
                                            ));
                                      },
                                  ),
                              ]),
                            )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lampiran :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() =>
                      controller.tugasDetail.value.data?.files?.isEmpty ?? true
                          ? const Text('Tidak ada lampiran')
                          : Text.rich(
                              TextSpan(children: [
                                for (var i = 0;
                                    i <
                                        controller.tugasDetail.value.data!
                                            .files!.length;
                                    i++)
                                  TextSpan(
                                    text:
                                        '   ${i + 1}. ${controller.tugasDetail.value.data!.files![i].name}\n',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        controller.launchInBrowser(
                                            "https://lms.official.biz.id/api/download-file-assignment/${controller.tugasDetail.value.data!.files![i].id}");
                                      },
                                  ),
                              ]),
                            )),
                  const SizedBox(height: 10),
                  const Text(
                    'Deadline :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Text(controller.tugasDetail.value.data != null
                      ? controller.formatTime(
                          controller.tugasDetail.value.data!.endDate)
                      : '')),
                  const SizedBox(height: 10),
                  Obx(() => controller.tugasDetail.value.data?.tugasAnda == null
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffD9D9D9)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Tugas Anda :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Obx(() => Text(
                                        controller.formatTime(controller
                                            .tugasDetail
                                            .value
                                            .data
                                            ?.tugasAnda!
                                            .createdAt),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(() => Text(
                                    controller.tugasDetail.value.data?.tugasAnda
                                            ?.description ??
                                        '',
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Lampiran :',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: 'File Tugas ',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        controller.launchInBrowser(
                                            'https://lms.official.biz.id/api/download-file-assignment-student/${controller.tugasDetail.value.data!.tugasAnda!.id}');
                                      },
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ))
                ],
              ),
            ),
            Obx(() => controller.isLoading.value
                ? const Center(
                    child: Loading(),
                  )
                : Container())
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(
            () => controller.tugasDetail.value.data != null &&
                    controller.isLoading.value == false
                ? SizedBox(
                    width: Get.width * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff069550),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed:
                            controller.tugasDetail.value.data!.tugasAnda != null
                                ? null
                                : () {
                                    controller.uploadModal();
                                  },
                        child: const Text('Upload')))
                : const SizedBox() //
            ));
  }
}
