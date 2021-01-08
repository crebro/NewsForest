import 'package:NewsForest/pages/Home.dart';
import 'package:NewsForest/providers/newsProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NewsProvider>.value(value: NewsProvider()),
    ],
    child: MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.robotoSlab().fontFamily),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      title: "News Forest | Everything News, Nepal ",
    ),
  ));
}
