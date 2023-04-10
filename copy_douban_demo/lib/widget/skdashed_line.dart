import 'package:flutter/material.dart';

// 虚线的参数解释,使用的还 父组件要确定高度 或者 宽度
/**
 * 1 axis 确定虚线的方向
 * 2 dashedWidth 宽度
 * 3 dashedHeight 高度
 * 4 count 内部会根据设置的个数和宽高确定密度（虚线的空白间隔）
 * 5 color 虚线的颜色
 * */

class SKDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  const SKDashedLine(
      {super.key,
      this.axis = Axis.horizontal,
      this.dashedWidth = 3,
      this.dashedHeight = 1,
      this.count = 20,
      this.color = Colors.redAccent});

  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: this.axis,
        // 默认充满布局
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(this.count, (_) {
          return SizedBox(
              width: this.dashedWidth,
              height: this.dashedHeight,
              child:
                  DecoratedBox(decoration: BoxDecoration(color: this.color)));
        }));
  }
}
