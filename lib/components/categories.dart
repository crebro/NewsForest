import 'package:NewsForest/components/categoryItem.dart';
import 'package:NewsForest/constants/category.dart';
import 'package:NewsForest/pages/Banking.dart';
import 'package:NewsForest/pages/GeneralNews.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<Category> categories = [
    Category(
        page: GeneralNewsPage(),
        name: "General",
        imageLocation:
            "https://images.unsplash.com/photo-1546422904-90eab23c3d7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80"),
    Category(
        page: BankingNewsPage(),
        name: "Banking",
        imageLocation:
            "https://cdn.pixabay.com/photo/2018/01/17/04/14/stock-exchange-3087396_960_720.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: "Categories".text.xl4.bold.make()),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                  height: 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: List.generate(
                              categories.length,
                              (index) => CategoryItem(
                                    category: categories[index],
                                  )),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
