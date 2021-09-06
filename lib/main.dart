import 'package:flutter/material.dart';
import 'package:newsapp/module/news.dart';
import 'package:newsapp/pages/home.dart';
import 'package:newsapp/pages/news.dart';
import 'package:newsapp/pages/news_page.dart';

import 'module/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes:{
        "/":(context)=> Home(),
        MyRoutes.newsRoute:(context)=>NewsPage("News"),
      }
    );
    }
  }


