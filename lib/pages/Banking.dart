import 'package:NewsForest/components/categoryItem.dart';
import 'package:NewsForest/constants/category.dart';
import 'package:NewsForest/pages/stock/stockExchangeData.dart';
import 'package:flutter/material.dart';

class BankingNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banking News"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CategoryItem(
                category: Category(
                    page: StockExchangeData(),
                    name: "Stock Exchange",
                    imageLocation:
                        "https://cdn.pixabay.com/photo/2020/01/22/10/56/stock-exchange-4785080_960_720.jpg"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
