import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/presensi_controller.dart';

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
        body: Padding(
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
                      const Text('Belum presensi',
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              controller.presensi('masuk');
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff069550),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                            child: const Row(
                              children: [
                                Text(
                                  'Masuk',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff069550),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
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
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                color: const Color(0xffD9D9D9),
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/tugas.png',
                    height: 40,
                  ),
                  title: const Text(
                    "Tugas",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Color(0xff444487)),
                  onTap: () {},
                ),
              ),
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
              Text('  ${controller.mapel.description}')
            ],
          ),
        ));
  }
}
