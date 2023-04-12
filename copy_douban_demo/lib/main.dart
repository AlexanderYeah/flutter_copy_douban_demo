import 'package:copy_douban_demo/pages/subject/about.dart';
import 'package:copy_douban_demo/pages/subject/detail.dart';
import 'package:copy_douban_demo/pages/subject/unknown.dart';
import 'package:copy_douban_demo/pages/tab/tab.dart';
import 'package:copy_douban_demo/widget/skdashed_line.dart';
import 'package:copy_douban_demo/widget/skstar_rating.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: MaterialPageRoute(),
      title: 'Flutter Demo',

      routes: {"/detail": (context) => DetailPage()},
      onGenerateRoute: (settings) {
        if (settings.name == "/about") {
          // 这里
          return MaterialPageRoute(
            builder: (context) {
              return AboutPage(message: settings.arguments);
            },
          );
        }
        return null;
      },
      // 跳转的路由未找到 就会走这个方法
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return UnkonwnPage();
          },
        );
      },

      theme: ThemeData(
          primarySwatch: Colors.green,
          // 去除点击水波纹的效果
          highlightColor: Colors.transparent),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return TabPage();
  }
}
