import 'dart:convert';

import 'package:http/http.dart' as http;

class JsonService {
  String url;
  JsonService(this.url);

  Future getData() async {
    var response = await http.get(this.url);
    // print(response.body);
    return jsonDecode(jsonEncode(response.body));
  }
}
