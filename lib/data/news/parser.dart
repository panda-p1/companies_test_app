import 'dart:math';

import 'package:news_test_app/constants/image_path.dart';
import 'package:news_test_app/data/news/news.dart';
import 'package:news_test_app/data/news/title_shorter.dart';

class NewsParser {
  const NewsParser._();

  static List<News> parseListJson(List<dynamic> json) {
    return json.map((object) => parseJson(object)).toList();
  }

  static News parseJson(Map<String, dynamic> json) {
    final date = genFutureDate();
    final title = json['title'] as String;
    final id = json['id'] as int;
    final body = json['body'] as String;
    final shortTitle = NewsTitleShorter(title, maxLength: 10,).shorten();

    return News(
      title: title,
      body: body,
      shortTitle: shortTitle,
      date: date,
      id: id,
      imagePath: ImagePath.newsInstance,
    );
  }

  static DateTime genFutureDate() {
    final gen = Random();
    int range = 5*365; //5 years
    return DateTime.now().add(Duration(days: gen.nextInt(range)));
  }
}