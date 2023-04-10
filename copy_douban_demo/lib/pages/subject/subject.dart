import 'package:copy_douban_demo/pages/subject/subject_content.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});
  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: SubjectContent(),
    );
  }
}
