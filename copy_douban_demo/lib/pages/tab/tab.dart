import 'package:copy_douban_demo/pages/home/home.dart';
import 'package:copy_douban_demo/pages/subject/subject.dart';
import 'package:copy_douban_demo/pages/tab/tab_bar_item.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIdx,
        children: [
          HomePage(),
          SubjectPage(),
          SubjectPage(),
          SubjectPage(),
          SubjectPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.green,
          onTap: (value) {
            setState(() {
              _currentIdx = value;
            });
          },
          currentIndex: _currentIdx,
          // 如果icon 数量超过4个的时候 必须把这个type设置一下 否则文字会被隐藏掉
          type: BottomNavigationBarType.fixed,
          items: [
            SKBottomBarItem("home", "首页"),
            SKBottomBarItem("subject", "书影音"),
            SKBottomBarItem("group", "小组"),
            SKBottomBarItem("mall", "市集"),
            SKBottomBarItem("profile", "我的")
          ]),
    );
  }
}
