import 'package:copy_douban_demo/pages/home/home_movie_item.dart';
import 'package:copy_douban_demo/pages/model/home_model.dart';
import 'package:flutter/material.dart';

import 'home_request.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<MovieItem> _movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() async {
    var res = await HomeRequest.requestMovieList(0);
    setState(() {
      _movies.addAll(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _movies.length,
      itemBuilder: (BuildContext context, int index) {
        return HomeMovieItem(_movies[index]);
      },
    );
  }
}
