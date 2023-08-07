import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../data/tugas_detail_response.dart';

class TopicView extends StatefulWidget {
  const TopicView({Key? key, required this.topicData}) : super(key: key);
  final Topic topicData;
  @override
  State<TopicView> createState() => _TopicViewState();
}

class _TopicViewState extends State<TopicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topik ${widget.topicData.name}',
            style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(data: widget.topicData.description),
          ),
        ),
      ),
    );
  }
}
