import 'package:NewsForest/components/news.dart';
import 'package:NewsForest/components/newsListItem.dart';
import 'package:NewsForest/providers/newsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var generalNews = Provider.of<NewsProvider>(context).getAllNews;
    return Scaffold(
        appBar: AppBar(
          title: Text("General News"),
        ),
        body: GridView.count(
            childAspectRatio: 2 / 2.7,
            crossAxisCount: 2,
            children: List.generate(
                generalNews.length, (index) => NewsData(generalNews[index]))));

    // body: ListView.builder(
    //     itemCount: generalNews.length,
    //     itemBuilder: (context, index) {
    //       return NewsListItem(
    //         news: generalNews[index],
    //       );
    //     }));
  }
}
