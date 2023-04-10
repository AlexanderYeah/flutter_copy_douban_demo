import 'dart:convert';

import 'package:copy_douban_demo/pages/model/home_model.dart';

import '../../http/http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    var res = await HTTPRequest.request(
        "/GwXjH2Pcb2d5a8f8129d761e0215f79b289e468a67d2359",
        params: {"uri": "/douban"});

    var subjects = jsonDecode(res)["subjects"];
    // 返回结果数据
    List<MovieItem> movies = [];
    // 循环遍历拿去数据
    for (int i = 0; i < subjects.length; i++) {
      var item = subjects[i];
      movies.add(MovieItem.fromMap(item));
    }
    return movies;
  }
}
