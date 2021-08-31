import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practiceapp2/utils/routes.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:3),(){
      Navigator.pushNamed(context,MyRoutes.homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 200,
        ),

      ),
    );
  }
}