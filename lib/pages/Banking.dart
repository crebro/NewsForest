import 'package:NewsForest/components/categoryItem.dart';
import 'package:NewsForest/constants/category.dart';
import 'package:NewsForest/models/news.dart';
import 'package:NewsForest/pages/stock/stockExchangeData.dart';
import 'package:NewsForest/providers/newsProvider.dart';
import 'package:NewsForest/services/apiExtractor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class BankingNewsPage extends StatefulWidget {
  @override
  _BankingNewsPageState createState() => _BankingNewsPageState();
}

class _BankingNewsPageState extends State<BankingNewsPage> {
  List<News> news = [];
  String businessApiKey = "bankingnews";
  final ApiExtractor apiExtractor = ApiExtractor();

  @override
  void initState() {
    super.initState();
    setNews();
  }

  void setNews() async {
    NewsProvider newsProvider =
        Provider.of<NewsProvider>(context, listen: false);
    List<News> providerNews = newsProvider.allNews[businessApiKey];
    if (providerNews == null) {
      List<News> tempNews = await apiExtractor.getAllNews(businessApiKey);
      if (this.mounted) {
        setState(() {
          this.news = tempNews;
        });
      }
      newsProvider.addNews(businessApiKey, tempNews);
    } else {
      if (this.mounted) {
        setState(() {
          this.news = providerNews;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banking News"),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
              ),

              this.news.isNotEmpty
                  ? Column(
                      children: List.generate(
                      this.news.length,
                      (index) => Card(
                        child: ListTile(
                          title: Text(news[index].title),
                        ),
                      ),
                    ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: SpinKitFoldingCube(
                            color: Colors.blue,
                            size: 50,
                          ),
                        ),
                      ],
                    )
              // ListView.builder(
              //     itemCount: this.news.length,
              //     itemBuilder: (context, index) {
              //       return Card(
              //         child: ListTile(
              //           title: Text(news[index].title),
              //         ),
              //       );
              // return VxBox(
              //   child: Text(
              //     news[index].title,
              //     style: TextStyle(fontSize: 20),
              //   ),
              // )
              //     .padding(EdgeInsets.all(15))
              //     .margin(EdgeInsets.all(15))
              //     .neumorphic()
              //     .make();
              // })
            ],
          ),
        ),
      ),
    );
  }
}
