import 'package:NewsForest/models/stockData.dart';
import 'package:NewsForest/pages/stock/companyData.dart';
import 'package:flutter/material.dart';

class StockDataItem extends StatelessWidget {
  final StockData stockData;
  StockDataItem({this.stockData});

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   child: AnimatedContainer(
    //     duration: Duration(milliseconds: 500),
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: this.isPositiveTrade(stockData.difference)
    //               ? Icon(
    //                   Icons.keyboard_arrow_up,
    //                   color: Colors.green,
    //                   size: 35,
    //                 )
    //               : Icon(
    //                   Icons.keyboard_arrow_down,
    //                   color: Colors.red,
    //                   size: 35,
    //                 ),
    //         ),
    //         Text(stockData.name)
    //       ],
    //     ),
    //   ),
    // );

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CompanyDataPage(stockData: stockData)));
      },
      child: Card(
        child: ListTile(
            title: Text(
              stockData.name,
              maxLines: 2,
            ),
            leading: this.isPositiveTrade(stockData.difference)
                ? Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.green,
                    size: 35,
                  )
                : Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.red,
                    size: 35,
                  ),
            trailing: Text(
              stockData.difference.toString(),
              style: TextStyle(
                fontSize: 20,
                color: isPositiveTrade(stockData.difference)
                    ? Colors.green
                    : Colors.red,
              ),
            )),
      ),
    );
  }

  bool isPositiveTrade(double number) {
    if (number >= 0) {
      return true;
    }
    return false;
  }
}
