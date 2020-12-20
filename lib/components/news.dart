import 'package:NewsForest/components/newsWebView.dart';
import 'package:NewsForest/models/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsData extends StatelessWidget {
  final News news;
  NewsData(this.news);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsWebView(url: this.news.articleUrl)));
      },
      child: VxBox(
          child: Column(
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: this.news.imageUrl != null
                    ? Image.network(
                        this.news.imageUrl,
                        height: 150,
                        width: 180,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/logo.png",
                        height: 150,
                        width: 180,
                        fit: BoxFit.cover,
                      )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 180,
                child: getTruncatedTitle(news.title)
                    .text
                    .xl
                    .maxLines(3)
                    .overflow(TextOverflow.ellipsis)
                    .textStyle(GoogleFonts.robotoSlab())
                    .bold
                    .black
                    .make(),
              ),
            ],
          ))
        ],
      )).padding(EdgeInsets.all(15)).neumorphic().make(),
    );
  }

  String getTruncatedTitle(String normal) {
    int limit = 47;
    if (normal.length > limit) {
      return normal.substring(0, limit) + " .. ";
    }
    return normal;
  }
}
