import 'package:flutter/material.dart';

// 继承自BottomNavigationBarItem
class SKBottomBarItem extends BottomNavigationBarItem {
  // 把初始化的数据传递给父类
  SKBottomBarItem(String iconName, String title)
      : super(
          label: title,
          icon: Image.asset("assets/images/tabbar/$iconName.png", width: 27),
          activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png",
              width: 27),
        );
}
