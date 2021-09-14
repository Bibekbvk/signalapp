
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

    return Scaffold(body: Stack(
    alignment: Alignment.center,
    children: <Widget>[Container(
      
      decoration: BoxDecoration(
                          gradient: LinearGradient(
                          colors: [Colors.blue.shade100,Colors.blue.shade200,Colors.blue.shade300,Colors.blue.shade400,],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter

                          )
                      
                            ),
      
    ),
    Container(
                alignment: Alignment.center,
                child: Text(
                  'Apple Stock',
                  style: TextStyle(
                    shadows: <Shadow>[
      Shadow(
        offset: Offset(10.0, 10.0),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      Shadow(
        offset: Offset(10.0, 10.0),
        blurRadius: 8.0,
        color: Color.fromARGB(125, 0, 0, 255),
      ),
    ],
    fontSize: 25.0,
  ),
                )),
    ]
    
    ),);
  }
}