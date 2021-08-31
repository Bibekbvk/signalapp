import 'package:flutter/material.dart';

class DrawerText extends StatelessWidget {
  DrawerText({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(label,style: TextStyle(color:Colors.white,),textScaleFactor: 1.2,);
  }
}

class FormSmallText extends StatelessWidget {
  FormSmallText({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(label,style:TextStyle(color:Colors.grey)),
    ));
  }
}
