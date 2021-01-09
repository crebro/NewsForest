import 'dart:convert';

import 'package:NewsForest/constants/apiConstants.dart';
import 'package:NewsForest/models/news.dart';
import 'package:NewsForest/models/stockData.dart';
import 'package:NewsForest/services/jsonService.dart';

class ApiExtractor {
  Future<List<News>> getAllNews(key) async {
    print("function called");
    print(key);
    List<News> returnNews = [];
    JsonService jsonService =
        JsonService(requestLocation + "/" + key.toString());
    print(jsonService.url);
    List result = json.decode(await jsonService.getData());

    returnNews = result
        .map((news) => News(
            title: news['title'],
            imageUrl: news['image'],
            articleUrl: news['url']))
        .toList();

    return returnNews;
  }

  Future<List<StockData>> getStockData(
      {String url:
          "https://nepse-data-api.herokuapp.com/data/todaysprice"}) async {
    List<StockData> returnData = [];

    JsonService jsonService = JsonService(url);
    List result = jsonDecode(await jsonService.getData());

    returnData = result
        .map((stockData) => StockData(
              name: stockData["companyName"],
              numberOfTransactions:
                  double.parse(stockData["noOfTransactions"].toString()),
              maxPrice: double.parse(stockData["maxPrice"].toString()),
              minPrice: double.parse(stockData["minPrice"].toString()),
              tradedShares: double.parse(stockData["tradedShares"].toString()),
              amount: double.parse(stockData["amount"].toString()),
              closingPrice: double.parse(stockData["closingPrice"].toString()),
              difference: double.parse(stockData["difference"].toString()),
              previousClosing:
                  double.parse(stockData["previousClosing"].toString()),
            ))
        .toList();

    return returnData;
  }
}
