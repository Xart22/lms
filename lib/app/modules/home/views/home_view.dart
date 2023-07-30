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
                          child: Obx(() => CachedNetworkImage(
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                          child: Text('', style: TextStyle(fontSize: 20))),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Profile'),
                          onTap: () {
                            Get.toNamed('/profile');
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.lock),
                          title: const Text('Ubah Password'),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.exit_to_app),
                          title: const Text('Logout'),
                          onTap: () {},
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
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text('',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            Text('Bidang',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color(0xff444487),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Row(children: [
                            Image(
                                image: AssetImage('assets/images/lokasi.png')),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Lokasi saat ini : ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text('asdsadas',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xffEEEEEE),
                            ),
                            child: Column(
                              children: [
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  color: const Color(0xffEEEEEE),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/dl.png',
                                      height: 40,
                                    ),
                                    title: const Text(
                                      "Dinas Luar",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xff444487)),
                                    onTap: () {
                                      Get.toNamed('/user-dinas-luar');
                                    },
                                  ),
                                ),
                                const Divider(
                                  color: Colors.white,
                                  height: 1,
                                  thickness: 2,
                                ),
                                Card(
                                  color: const Color(0xffEEEEEE),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/izin.png',
                                      height: 40,
                                    ),
                                    title: const Text(
                                      "Izin / Sakit",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xff444487)),
                                    onTap: () {
                                      Get.toNamed('/user-izin');
                                    },
                                  ),
                                ),
                                const Divider(
                                  color: Colors.white,
                                  height: 1,
                                  thickness: 2,
                                ),
                                Card(
                                  color: const Color(0xffEEEEEE),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/laporan.png',
                                      height: 40,
                                    ),
                                    title: const Text(
                                      "Laporan Kegiatan",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xff444487)),
                                    onTap: () {
                                      Get.toNamed('/user-laporan-kegiatan');
                                    },
                                  ),
                                ),
                                const Divider(
                                  color: Colors.white,
                                  height: 1,
                                  thickness: 2,
                                ),
                                Card(
                                  color: const Color(0xffEEEEEE),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                  ),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/rekap.png',
                                      height: 40,
                                    ),
                                    title: const Text(
                                      "Rekap Absensi",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xff444487)),
                                    onTap: () {
                                      Get.toNamed('/rekap-user');
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
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
