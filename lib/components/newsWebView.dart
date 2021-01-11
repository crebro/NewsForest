import 'package:NewsForest/components/title.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatelessWidget {
  final String url;
  NewsWebView({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Post"),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: this.url,
            ),
          ),
        ],
      ),
    );
  }
}
