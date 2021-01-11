import 'package:NewsForest/models/stockData.dart';
import 'package:flutter/material.dart';

class CompanyDataPage extends StatelessWidget {
  final StockData stockData;
  CompanyDataPage({@required this.stockData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockData.name),
      ),
      // body: ,
    );
  }
}
