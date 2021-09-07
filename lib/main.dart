import 'package:flutter/material.dart';
import 'package:signalapp/pages/body.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: AnimatedSplashScreen(
        backgroundColor: Colors.grey,
        duration: 1,
        splash: Image.network('http://simpleicon.com/wp-content/uploads/apple.png'),
       nextScreen:Body(),
       splashTransition: SplashTransition.rotationTransition,
       ),
    );
  }
}
 
