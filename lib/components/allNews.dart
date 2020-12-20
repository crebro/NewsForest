import 'package:NewsForest/components/newsSection.dart';
import 'package:NewsForest/constants/papersImages.dart';
import 'package:NewsForest/models/newsSource.dart';
import 'package:flutter/material.dart';

class AllNews extends StatelessWidget {
  final List<NewsSource> sources = [
    NewsSource(
        imageUrl: PaperImages.kathmanduPost,
        key: "kathmandupost",
        name: "Kathmandu Post"),
    NewsSource(
        imageUrl: PaperImages.kantipur, key: "kantipur", name: "Kantipur"),
    NewsSource(
        imageUrl: PaperImages.nayaPatrika,
        key: "nayapatrika",
        name: "Naya Patrika"),
    NewsSource(
        imageUrl: PaperImages.himalayanTimes,
        key: "himalayantimes",
        name: "Himalayan Times"),
    NewsSource(
        imageUrl: PaperImages.himalayanTimes,
        key: "gorkhapatra",
        name: "Gorkha Patra"),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: sources.length,
            itemBuilder: (context, index) {
              return NewsSection(source: sources[index]);
            }));
  }
}
