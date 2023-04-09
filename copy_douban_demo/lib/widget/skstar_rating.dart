import 'package:flutter/material.dart';

class SKStartRating extends StatefulWidget {
  final double rating; // 当前分
  final double maxRating; // 满分
  final int count; // 默认星星
  final double size; //大小
  final Color unselectedColor;
  final Color selectedColor;
  // 自定义星星的图片
  final String? unselectedImage;
  final String? selectedImage;

  SKStartRating(this.rating,
      {super.key,
      this.maxRating = 10,
      this.count = 5,
      this.size = 30,
      this.unselectedColor = Colors.grey,
      this.selectedColor = Colors.redAccent,
      this.unselectedImage = null,
      this.selectedImage = null});

  @override
  State<SKStartRating> createState() => _SKStartRatingState();
}

class _SKStartRatingState extends State<SKStartRating> {
  Widget? unselectedStarWidget;
  Widget? selectedStarWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 如果有图片的话 就是图片 没有的话 就是 图标
    if (widget.unselectedImage != null) {
      unselectedStarWidget = Image.asset(widget.unselectedImage!);
    } else {
      unselectedStarWidget = Icon(
        Icons.star_border,
        color: widget.unselectedColor,
        size: widget.size,
      );
    }
    if (widget.selectedImage != null) {
      selectedStarWidget = Image.asset(widget.selectedImage!);
    } else {
      selectedStarWidget = Icon(
        Icons.star,
        color: widget.selectedColor,
        size: widget.size,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
            mainAxisSize: MainAxisSize.min,
            children: _buildUnselectedStarItems()),
        Row(mainAxisSize: MainAxisSize.min, children: _buildSelectedStarItems())
      ],
    );
  }

  // buildStar
  List<Widget> _buildUnselectedStarItems() {
    return List.generate(widget.count, ((index) {
      return unselectedStarWidget!;
    }));
  }

  List<Widget> _buildSelectedStarItems() {
    // 1 创建stars
    List<Widget> stars = [];

    // 2 构建满填充的star

    // 每一个星星所占的值 比如说满分10 最大5个星 则每个为2
    double oneStarVal = widget.maxRating / widget.count;
    // 整数部分的星星 向下取整  比如说  7 / 2 = 3.5 整数部分为3
    int fullStarCount = (widget.rating / oneStarVal).floor();

    for (int i = 0; i < fullStarCount; i++) {
      // 前面整数的星星填进去了
      stars.add(selectedStarWidget!);
    }
    // 剩余的宽度
    double leftWidth =
        ((widget.rating / oneStarVal) - fullStarCount) * widget.size;
    if (leftWidth > 0) {
      // 构建部分填充star 使用ClipRect 使用clipper 属性 自定义CustomClipper
      stars.add(ClipRect(
        clipper: SKStarClipper(leftWidth),
        child: selectedStarWidget!,
      ));
    }

    return stars;
  }
}

// 这个我们是自定义裁剪的形状   CustomClipper 是泛型类 我们告诉他要裁剪的是矩形的
class SKStarClipper extends CustomClipper<Rect> {
  double clipWidth;
  SKStarClipper(this.clipWidth);
  // 实现抽象类的方法
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    // 这里就是定义了要裁剪的范围 上下左右 right 多少是要动态计算的
    return Rect.fromLTRB(0, 0, clipWidth, size.height);
  }

  @override
  bool shouldReclip(covariant SKStarClipper oldClipper) {
    // TODO: implement shouldReclip
    // 是否需要重新裁剪 当且仅当旧的clipper 的 clipWidth 和 当前的 clipWidth 不相等的时候需要重新裁剪
    return oldClipper.clipWidth != this.clipWidth;
  }
}
