import 'package:NewsForest/components/stockDataItem.dart';
import 'package:NewsForest/models/stockData.dart';
import 'package:NewsForest/services/apiExtractor.dart';
import 'package:flutter/material.dart';

class StockExchangeData extends StatefulWidget {
  @override
  _StockExchangeDataState createState() => _StockExchangeDataState();
}

class _StockExchangeDataState extends State<StockExchangeData> {
  List<StockData> stockData = [];
  ApiExtractor apiExtractor = ApiExtractor();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStockData();
  }

  void getStockData() async {
    print("getting the stock data please wait");
    List<StockData> result = await apiExtractor.getStockData();
    print(result);
    if (this.mounted) {
      setState(() {
        this.stockData = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEPSE Data"),
      ),
      body: ListView.builder(
          itemCount: stockData.length,
          itemBuilder: (context, index) {
            return StockDataItem(stockData: stockData[index]);
          }),
    );
  }
}
