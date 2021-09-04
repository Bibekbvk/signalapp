import 'dart:convert';
import 'package:signalapp/constant.dart';
import 'package:signalapp/module/news.dart';
import 'package:http/http.dart' as http;

class DatabaseService{

Future<List<news>> allitem() async {
    var data = await http.get(
      "$BASE_URL/api/getnews",
      
    );

    var jsonData = json.decode((data.body));

    List<news> allitems = [];
    for (var each in jsonData) {
      news wallpaperList = news(
          news_id: each['news_id'],
          date: each['date'],
          heading: each['heading'],
          image1: each['image1'],
          news1: each['news1'],
          news2: each['news2'],
          image2: each['image2'],
          news3: each['news3'],
          auther: each['auther']
          );
      allitems.add(wallpaperList);
    }
    return allitems;
  }


}