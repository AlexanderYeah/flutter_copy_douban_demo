import 'package:flutter/material.dart';

class UnkonwnPage extends StatefulWidget {
  const UnkonwnPage({super.key});

  @override
  State<UnkonwnPage> createState() => _UnkonwnPageState();
}

class _UnkonwnPageState extends State<UnkonwnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误页面"),
      ),
      body: Container(
        child: Center(
          child: Text("这里是错误页面"),
        ),
      ),
    );
  }
}
