import 'package:NewsForest/components/allNews.dart';
import 'package:NewsForest/components/categories.dart';
import 'package:NewsForest/components/title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ApplicationTitle(),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Categories(),
                      AllNews(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
