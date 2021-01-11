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
  String searchQuery = "";
  bool searching = false;

  @override
  void initState() {
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value != "") {
                    this.searchQuery = value;
                    if (!this.searching) {
                      this.searching = true;
                    }
                  } else {
                    this.searching = false;
                  }
                });
              },
              decoration: InputDecoration(hintText: "Search For Banks"),
            ),
          ),
          !this.searching
              ? Expanded(
                  child: ListView.builder(
                      itemCount: stockData.length,
                      itemBuilder: (context, index) {
                        return StockDataItem(stockData: stockData[index]);
                      }),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: this
                          .stockData
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(this.searchQuery.toLowerCase()))
                          .length,
                      itemBuilder: (context, index) {
                        List<StockData> items = this
                            .stockData
                            .where((element) => element.name
                                .toLowerCase()
                                .contains(this.searchQuery.toLowerCase()))
                            .toList();
                        return StockDataItem(stockData: items[index]);
                      }))
        ],
      ),
    );
  }
}
