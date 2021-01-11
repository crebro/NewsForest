import 'package:NewsForest/models/news.dart';
import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget {
  final News news;
  NewsListItem({this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(news.title),
    ));
  }
}
