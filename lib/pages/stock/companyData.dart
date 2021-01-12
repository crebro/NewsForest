import 'package:NewsForest/models/stockData.dart';
import 'package:google_fonts/google_fonts.dart';
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: 3,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: VxBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildValue("High", this.stockData.maxPrice),
                        buildValue("Low", this.stockData.minPrice),
                        buildValue(
                            "Traded Quantity", this.stockData.tradedShares),
                        buildValue("Total Trades",
                            this.stockData.numberOfTransactions),
                        buildValue(
                            "Previous Closing", this.stockData.previousClosing),
                        buildValue(
                            "Closing Price", this.stockData.closingPrice),
                      ],
                    ),
                  ).padding(EdgeInsets.all(15)).rounded.neumorphic().make(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildValue(
    String name,
    dynamic value,
  ) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "$name: ",
        style: TextStyle(
            fontSize: 25,
            color: Colors.grey[700],
            fontFamily: GoogleFonts.robotoSlab().fontFamily),
      ),
      Text(
        value.toString(),
        style: TextStyle(color: Colors.grey[700], fontSize: 25),
      )
    ]);
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
