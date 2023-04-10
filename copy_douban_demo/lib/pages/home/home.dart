import 'package:copy_douban_demo/pages/home/home_request.dart';
import 'package:flutter/material.dart';
import 'home_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: HomeContent(),
    );
  }
}
