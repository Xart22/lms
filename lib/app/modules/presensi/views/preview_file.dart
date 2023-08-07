import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewFile extends StatefulWidget {
  const PreviewFile({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  State<PreviewFile> createState() => _PreviewFileState();
}

class _PreviewFileState extends State<PreviewFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: CachedNetworkImage(
          imageUrl: widget.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
