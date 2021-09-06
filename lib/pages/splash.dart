
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//splash News
// ignore: must_be_immutable

class SplashScreen extends StatelessWidget {
int duration = 0;
Widget goToPage;
SplashScreen({ required this.goToPage, required this.duration});
  @override 
  Widget build(BuildContext context) {
Future.delayed(Duration(seconds: this.duration),(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> this.goToPage));
});

    return Scaffold(body: Container(color: Colors.white,
    alignment: Alignment.center,
    child: Image.asset(
                  "assets/macho.JPG",
                  height: 200.0,
                  fit: BoxFit.cover,
                  
                ),),);
  }
}