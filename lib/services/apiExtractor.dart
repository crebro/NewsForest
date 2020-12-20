import 'dart:convert';

import 'package:NewsForest/constants/apiConstants.dart';
import 'package:NewsForest/models/news.dart';
import 'package:NewsForest/services/jsonService.dart';

class ApiExtractor {
  Future<List<News>> getAllNews(key) async {
    print("function called");
    print(key);
    List<News> returnNews = [];
    JsonService jsonService =
        JsonService(requestLocation + "/" + key.toString());
    print(jsonService.url);
    List result = json.decode(await jsonService.getData());

    returnNews = result
        .map((news) => News(
            title: news['title'],
            imageUrl: news['image'],
            articleUrl: news['url']))
        .toList();

    return returnNews;
  }
}
