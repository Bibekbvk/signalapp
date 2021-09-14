import 'dart:convert';
import 'package:signalapp/constant.dart';
import 'package:signalapp/module/article.dart';
import 'package:signalapp/module/news.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class DatabaseService{

Future<List<news>> allitem() async {
    var data = await http.get(
      "$BASE_URL/api/news",
      
      
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

Future<List<article>> item() async {
    var data = await http.get(
      "$BASE_URL/api/article",
      
      
    );

    var jsonData = json.decode((data.body));

    List<article> items = [];
    for (var each in jsonData) {
      // ignore: non_constant_identifier_names
      article ArticleList = article(
          Article_ID: each['Article_ID'],
          Date: each['Date'],
          Heading: each['Heading'],
          Image1: each['Image1'],
          Article1: each['Article1'],
          Article2: each['Article2'],
          Image2: each['Image2'],
          Article3: each['Article3'],
          Auther: each['Auther']
          );
      items.add(ArticleList);
    }
    return items;
  }

}