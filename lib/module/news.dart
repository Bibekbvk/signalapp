import 'package:flutter/material.dart';


class news{
  final int news_id;
  final String date;
  final String heading;
  final String image1;
  final String news1;
  final String news2;
  final String image2;
  final String news3;
  final String auther;
  

  news(
      {required this.news_id,
      required this.date,
      required this.heading,
      required this.image1,
      required this.news1,
      required this.news2,
      required this.image2,
       required this.news3,
       required this.auther, 
     });
}
