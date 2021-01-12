import 'package:NewsForest/models/stockData.dart';
import 'package:NewsForest/pages/stock/companyData.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StockDataItem extends StatelessWidget {
  final StockData stockData;
  StockDataItem({this.stockData});

  @override
  Widget build(BuildContext context) {
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
            leading: Icon(
              this.getTradeIcon(),
              color: this.getTradeColor(),
              size: 35,
            ),
            trailing: Text(
              stockData.difference.toString(),
              style: TextStyle(
                fontSize: 20,
                color: getTradeColor(),
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

  IconData getTradeIcon() {
    double number = this.stockData.difference;
    if (number > 0) {
      return Icons.keyboard_arrow_up;
    } else if (number == 0) {
      return Icons.remove;
    }
    return Icons.keyboard_arrow_down;
  }

  Color getTradeColor() {
    double number = this.stockData.difference;
    if (number > 0) {
      return Colors.green;
    } else if (number == 0) {
      return Colors.orange;
    }
    return Colors.red;
  }
}
