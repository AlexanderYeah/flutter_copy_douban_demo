import 'package:copy_douban_demo/pages/subject/detail.dart';
import 'package:flutter/material.dart';

class SubjectContent extends StatefulWidget {
  const SubjectContent({super.key});

  @override
  State<SubjectContent> createState() => _SubjectContentState();
}

class _SubjectContentState extends State<SubjectContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("去详情页面"),
        onPressed: () => _jumpToUnknown(context),
      ),
    );
  }

  _jumpToDetail(BuildContext context) {
    Navigator.of(context).pushNamed("/detail");
  }

  _jumpToUnknown(BuildContext context) {
    Navigator.of(context).pushNamed("/xxxxx");
  }
}
