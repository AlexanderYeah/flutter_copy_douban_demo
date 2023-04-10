// 自己手写的模型

class Person {
  String? name;
  String? avatarUrl;
  Person.fromMap(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarUrl = json["avatar"];
  }
}

class Actor extends Person {
  Actor.fromMap(super.json) : super.fromMap();
}

class Director extends Person {
  Director.fromMap(super.json) : super.fromMap();
}

// 这里自己维护一个变量
int count = 1;

class MovieItem {
  int? rank;
  String? rating;
  String? average;
  String? genres;
  String? imageUrl;
  String? title;
  String? year;
  String? originalTitle;
  List? casts;
  String? director;
  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = count++;
    this.rating = json["rating"];
    this.average = json["average"];
    this.genres = json["genres"];
    this.imageUrl = json["imageUrl"];
    this.title = json["title"];
    this.year = json["year"];
    this.originalTitle = json["originalTitle"];
    // 演员数组
    this.casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
    this.director = json["director"];
  }

  // 打印控制台可以显示
  @override
  String toString() {
    // TODO: implement toString
    return "MovieItem(rank:$rank,title:$title,originalTitle:$originalTitle)";
  }
}
