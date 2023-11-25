import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_demo/model.dart';

class Api {
  //https://jsonplaceholder.typicode.com/photos?_page=0&_limit=5
  Future<List<Data>?> fetchData() async {
    print("fetching data");
    try {
      var response = await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/photos',
        ),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Data> dataList = [];
        for (Map<String, dynamic> item in jsonData) {
          dataList.add(Data.fromJson(item));
        }
        return dataList;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);

      return null;
    }
  }
}
