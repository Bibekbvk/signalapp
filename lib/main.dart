import 'package:flutter/material.dart';
import 'package:practiceapp2/pages/home_page.dart';
import 'package:practiceapp2/pages/login_page.dart';
import 'package:practiceapp2/pages/signup_page.dart';
import 'package:practiceapp2/pages/splash.dart';
import 'package:practiceapp2/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          textTheme: TextTheme(
            headline6:TextStyle(
              color: Colors.blue,
              fontSize: 15.0,
            )
          ),
          iconTheme: IconThemeData(
            color: Colors.blue,
          )

        ),
        primarySwatch: Colors.blue,
      ),
      routes:{
        "/":(context)=> Splash(),
        MyRoutes.loginRoute:(context)=>LoginPage(),
        MyRoutes.signupRoute:(context)=>SignupPage(),
        MyRoutes.homeRoute:(context)=>MyHomePage(),
      }
    );
  }
}


