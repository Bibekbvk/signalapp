import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:signalapp/pages/news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/first.png',
          height: 20000,
          width: 5000,
        ),
        
        nextScreen: MyHomePage(title: '',),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor:Colors.black,
        appBar: AppBar(
        title: Text("Welcome to the News Express"),
        backgroundColor: Colors.red,
        centerTitle: true,
        ),
         
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height:10,
            ),
              Image( 
                  image: AssetImage("assets/img.png"),
                  ),
                 
            
            ElevatedButton(
        onPressed: () {
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => wallpaperPage('')));
        },
        child: Text(
          'Apple Stock News',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          padding: EdgeInsets.all(15),
          elevation: 5,
        ),
            ),
      //       Container(
      //         decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/img.png"),
      //     fit: BoxFit.cover
      //   ) ,
      // ),
      //       )
  
              

        //  InkWell(child: Text("Tap to go to home screen"),
        //  onTap: (){
        //   Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => wallpaperPage('Wallpaper')));
        //  },)
          ],
        ),
      ),
    );
  }
}
