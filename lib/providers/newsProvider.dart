import 'package:NewsForest/models/news.dart';
import 'package:flutter/cupertino.dart';

class NewsProvider extends ChangeNotifier {
  Map<String, List<News>> allNews = {};

  void addNews(String providerKey, List<News> providerNews) {
    if (this.allNews[providerKey.toString()] != null) {
      allNews[allNews.toString()].addAll(providerNews);
    } else {
      allNews[providerKey.toString()] = providerNews;
    }

    notifyListeners();
  }
}
