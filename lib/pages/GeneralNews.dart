import 'package:NewsForest/components/news.dart';
import 'package:NewsForest/components/newsListItem.dart';
import 'package:NewsForest/providers/newsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class GeneralNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var generalNews = Provider.of<NewsProvider>(context).getAllNews;
    return Scaffold(
        appBar: AppBar(
          title: Text("General News"),
        ),
        body: generalNews.isNotEmpty
            ? GridView.count(
                childAspectRatio: 2 / 2.7,
                crossAxisCount: 2,
                children: List.generate(generalNews.length,
                    (index) => NewsData(generalNews[index])))
            : SpinKitFoldingCube(
                color: Colors.blue,
                size: 50,
              ));
  }
}
