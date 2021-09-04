import 'package:flutter/material.dart';


class news{
  final int P_id;
  final String type;
  final String name;
  final String descr;
  final String price;
  final String items;
  final String others;
  final String made;
  final String images;
  

  news(
      {required this.P_id,
      required this.type,
      required this.name,
      required this.descr,
      required this.price,
      required this.items,
      required this.others,
       required this.made,
       required this.images, 
     });
}
