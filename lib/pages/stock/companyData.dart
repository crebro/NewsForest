import 'package:NewsForest/models/stockData.dart';
import 'package:velocity_x/velocity_x.dart';
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
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    stockData.maxPrice.text
                        .color(this.getTradeColor())
                        .xl5
                        .make(),
                    Icon(
                      this.isPositiveTrade()
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: this.getTradeColor(),
                      size: 50,
                    ),
                  ],
                ),
                stockData.difference.text
                    .color(this.getTradeColor())
                    .xl3
                    .make(),
              ],
            ),
            buildValue("High", this.stockData.maxPrice),
            buildValue("Low", this.stockData.minPrice),
            buildValue("Traded Quantity", this.stockData.tradedShares),
            buildValue("Total Trades", this.stockData.numberOfTransactions),
            buildValue("Previous Closing ", this.stockData.previousClosing),
            buildValue("Closing Price", this.stockData.closingPrice),
          ],
        ),
      ),
    );
  }

  Widget buildValue(
    String name,
    dynamic value,
  ) {
    return RichText(
        text: TextSpan(
            children: [
          TextSpan(
              text: value.toString(), style: TextStyle(color: Colors.grey[700]))
        ],
            text: "$name: ",
            style: TextStyle(fontSize: 30, color: Color(0xfff7921c))));
  }

  bool isPositiveTrade() {
    var number = stockData.difference;
    if (number >= 0) {
      return true;
    }
    return false;
  }

  Color getTradeColor() {
    return this.isPositiveTrade() ? Colors.green : Colors.red;
  }
}
