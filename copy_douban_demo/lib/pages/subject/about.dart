import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  Object? message;
  AboutPage({super.key, this.message});
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页面"),
      ),
      body: Container(
        child: Center(
          child: Text("这是详情页面"),
        ),
      ),
    );
  }
}
