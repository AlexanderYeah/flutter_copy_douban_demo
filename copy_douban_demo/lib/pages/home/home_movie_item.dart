import 'package:copy_douban_demo/pages/model/home_model.dart';
import 'package:copy_douban_demo/widget/skdashed_line.dart';
import 'package:copy_douban_demo/widget/skstar_rating.dart';
import 'package:flutter/material.dart';

class HomeMovieItem extends StatelessWidget {
  final MovieItem movie;
  const HomeMovieItem(this.movie, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffdddddd)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          // 顶部排行图标
          _buildHeader(),
          SizedBox(
            height: 10,
          ),
          // 中部电影信息
          _buildContent(),
          SizedBox(
            height: 10,
          ),
          // 底部电影名字
          _buildFooter(),
          // 分割线
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(color: Color.fromARGB(255, 238, 205, 144)),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  /*****---中间-----***/
  _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentImage(),
        SizedBox(
          width: 8,
        ),
        _buildContentInfo(),
        SizedBox(
          height: 5,
        ),
        _buildContentDashedLine(),
        SizedBox(
          height: 5,
        ),
        _buildContentWantSee()
      ],
    );
  }

  _buildContentInfo() {
    // 内容可以伸缩的 这样就不会溢出
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentInfoTitle(),
        SizedBox(
          height: 5,
        ),
        _buildContentInfoRating(),
        SizedBox(
          height: 5,
        ),
        _buildContentInfoDesc(),
      ],
    ));
  }

  _buildContentInfoTitle() {
    return Text.rich(TextSpan(children: [
      WidgetSpan(
          child: Padding(
        padding: EdgeInsets.only(left: 5, right: 4),
        child: Icon(
          Icons.play_circle_outline,
          color: Colors.redAccent,
          size: 18,
        ),
      )),
      TextSpan(
        text: "${movie.title}",
        style: TextStyle(
            color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      TextSpan(
          text: "(${movie.year})",
          style: TextStyle(color: Colors.grey, fontSize: 14))
    ]));
  }

  _buildContentInfoRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 7,
        ),
        SKStartRating(
          double.parse(movie.rating!),
          size: 20,
        ),
        // 分数显示
        SizedBox(
          width: 8,
        ),
        Text(movie.rating!)
      ],
    );
  }

  _buildContentInfoDesc() {
    // 字符串拼接
    final str = movie.genres! +
        movie.director! +
        movie.casts!.map((e) => e.name).toList().join(" ");
    return Text(
      str,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.black87),
    );
  }

  _buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Image.network(
        movie.imageUrl!,
        height: 140,
        width: 100,
        fit: BoxFit.fill,
      ),
    );
  }

  // 虚线
  _buildContentDashedLine() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 80,
      child: SKDashedLine(
        axis: Axis.vertical,
        dashedHeight: 3,
        dashedWidth: 1.5,
        color: Colors.grey,
        count: 12,
      ),
    );
  }

  // 想看
  _buildContentWantSee() {
    return Container(
      alignment: Alignment.center,
      width: 60,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_alarm,
            color: Colors.orange,
          ),
          Text("想看")
        ],
      ),
    );
  }

  /*****---底部-----***/
  _buildFooter() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 203, 202, 202),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Text(
        "${movie.originalTitle}",
        style: TextStyle(color: Colors.black54, fontSize: 18),
      ),
    );
  }
}
