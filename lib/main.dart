import 'package:NewsForest/pages/Home.dart';
import 'package:NewsForest/providers/newsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NewsProvider>.value(value: NewsProvider()),
    ],
    child: MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      title: "News Forest | Everything News, Nepal ",
    ),
  ));
}
