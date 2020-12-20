import 'package:NewsForest/components/news.dart';
import 'package:NewsForest/components/shimmerLayout.dart';
import 'package:NewsForest/models/news.dart';
import 'package:NewsForest/models/newsSource.dart';
import 'package:NewsForest/providers/newsProvider.dart';
import 'package:NewsForest/services/apiExtractor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsSection extends StatefulWidget {
  final NewsSource source;
  NewsSection({this.source});

  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  List<News> news = [];
  final ApiExtractor apiExtractor = ApiExtractor();

  @override
  void initState() {
    super.initState();
    setNews();
  }

  void setNews() async {
    NewsProvider newsProvider =
        Provider.of<NewsProvider>(context, listen: false);
    List<News> providerNews = newsProvider.allNews[widget.source.key];
    if (providerNews == null) {
      List<News> tempNews = await apiExtractor.getAllNews(widget.source.key);
      if (this.mounted) {
        setState(() {
          this.news = tempNews;
        });
      }
      newsProvider.addNews(widget.source.key, tempNews);
    } else {
      if (this.mounted) {
        setState(() {
          this.news = providerNews;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: widget.source.name.text.xl2
                        .textStyle(GoogleFonts.robotoSlab())
                        .bold
                        .make()),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          this.news.isNotEmpty
              ? Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 275,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: news.length,
                            itemBuilder: (context, index) {
                              return NewsData(
                                news[index],
                              );
                            }),
                      ),
                    ),
                  ],
                )
              : Shimmer.fromColors(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ShimmerLayout(),
                        ShimmerLayout(),
                        ShimmerLayout(),
                        ShimmerLayout(),
                      ],
                    ),
                  ),
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.white)
        ],
      ),
    );
  }
}
