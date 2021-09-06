import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/module/routes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context,MyRoutes.newsRoute);
                  },
                  child: Icon(
                    CupertinoIcons.news,
                    size: 40,
                    color: Colors.white,
                  ),
                  constraints: BoxConstraints.tightFor(
                    height: 70,
                    width: 70,
                  ),
                  elevation: 6.0,
                  shape: CircleBorder(),
                  fillColor: Colors.blueAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
