import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          endDrawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Stack(children: [
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => Center(
                          child: Text(
                              controller.userData.value.data?.user.name ?? '',
                              style: const TextStyle(fontSize: 20)))),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.exit_to_app),
                          title: const Text('Logout'),
                          onTap: () {
                            controller.modalLogout();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          body: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(
              children: [
                Stack(children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/home.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Obx(() => Text(
                                'Halo, ${controller.userData.value.data == null ? '' : controller.userData.value.data!.user.name}',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                            Obx(() => Text(
                                controller.userData.value.data == null
                                    ? ''
                                    : controller.userData.value.data!.kelas
                                            .description ??
                                        '',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color(0xffDD9426),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(children: [
                            const Image(
                                image: AssetImage('assets/images/lokasi.png')),
                            const SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Lokasi anda: ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Obx(() => Text(controller.address.value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )))
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/mapel.png',
                              width: 30,
                              height: 30,
                            ),
                            const Text('Mata Pelajaran',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Obx(() => controller.userData.value.data == null
                          ? const Text('Tidak Ada Mata Pelajaran')
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                width: Get.width,
                                height: 70 *
                                    controller
                                        .userData.value.data!.subject.length
                                        .toDouble(),
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xffEEEEEE),
                                ),
                                child: ListView.builder(
                                    itemCount:
                                        controller.userData.value.data == null
                                            ? 0
                                            : controller.userData.value.data!
                                                .subject.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        color: const Color(0xffD9D9D9),
                                        child: ListTile(
                                          isThreeLine: false,
                                          leading: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: const Color(0xff071759),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/mapel.png'),
                                                    scale: 0.5)),
                                            width: 40,
                                            height: 40,
                                          ),
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  controller.userData.value
                                                              .data ==
                                                          null
                                                      ? ''
                                                      : controller
                                                              .userData
                                                              .value
                                                              .data!
                                                              .subject[index]
                                                              .subject
                                                              ?.name ??
                                                          '',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  controller.userData.value
                                                              .data ==
                                                          null
                                                      ? ''
                                                      : controller
                                                          .userData
                                                          .value
                                                          .data!
                                                          .subject[index]
                                                          .startTime,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ]),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color(0xff071759),
                                          ),
                                          onTap: () {
                                            Get.toNamed('/presensi',
                                                arguments: controller
                                                    .userData
                                                    .value
                                                    .data!
                                                    .subject[index]);
                                          },
                                        ),
                                      );
                                    }),
                              ),
                            )),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/mapel.png',
                              width: 30,
                              height: 30,
                            ),
                            const Text('Tugas',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Obx(() => controller.userData.value.data == null
                          ? const Text('Tidak Ada Tugas')
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                width: Get.width,
                                height: 70 *
                                    controller
                                        .userData.value.data!.assignment.length
                                        .toDouble(),
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xffEEEEEE),
                                ),
                                child: ListView.builder(
                                    itemCount: controller
                                        .userData.value.data!.assignment.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        color: const Color(0xffD9D9D9),
                                        child: ListTile(
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    controller.userData.value
                                                                .data ==
                                                            null
                                                        ? ''
                                                        : controller
                                                            .userData
                                                            .value
                                                            .data!
                                                            .assignment[index]
                                                            .subject
                                                            .name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    controller.userData.value
                                                                .data ==
                                                            null
                                                        ? ''
                                                        : controller.formatTime(
                                                            controller
                                                                .userData
                                                                .value
                                                                .data!
                                                                .assignment[
                                                                    index]
                                                                .endDate),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ]),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color(0xff071759),
                                          ),
                                          onTap: () {
                                            Get.toNamed('/tugas-detail',
                                                arguments: controller
                                                    .userData
                                                    .value
                                                    .data!
                                                    .assignment[index]
                                                    .id);
                                          },
                                        ),
                                      );
                                    }),
                              ),
                            )),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Builder(builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.menu,
                            color: Colors.white, size: 30),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      );
                    }),
                  ),
                ])
              ],
            ),
          )),
    );
  }
}
