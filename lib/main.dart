import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signalapp/pages/Registration.dart';
import 'package:signalapp/pages/Signal.dart';
import 'package:signalapp/pages/article.dart';
import 'package:signalapp/pages/drawer.dart';
import 'package:signalapp/pages/login.dart';
import 'package:signalapp/pages/news.dart';
import 'package:signalapp/pages/splash.dart';
import 'package:signalapp/pages/feedback.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: SplashScreen(
        duration: 3,
        goToPage: Logins(),
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        drawer: SideDrawer(),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade200,
                  Colors.blue.shade300,
                  Colors.blue.shade400,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [


                      // First Row 
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      

                      // Signal Button
                      Column(children: [
                  
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Signal('')));
                        },
                        
                        child: Icon(Icons.signal_cellular_alt_sharp, color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Text('Signal')
                      ],),

                      // News Button
                       Column(children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Signal('')));
                        },
                        
                        child: Icon(Icons.menu_book_outlined, color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Text('News')
                      ],),

                      ///Trending button
                       Column(children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=> Article('')));
                              // builder: (context) => Article('')));
                        },
                        child: Icon(Icons.trending_up, color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Text('Trending')
                      ],),
                    ],
                  ),


                  //Second row 
                  SizedBox(height: 50,),
                  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      
                    
                      // Article Button
                       Column(children: [
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => Article('')));
                      //   },
                        
                      //    child: Icon(Icons.article, color: Colors.black,),
                      //   style: ElevatedButton.styleFrom(
                      //     primary: Colors.white,
                      //     padding: EdgeInsets.all(15),
                      //     elevation: 5,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(5)),
                      //   ),
                      // ),
                      Text('Article')
                      ],),

                      // Feedback
                       Column(children: [
                      ElevatedButton(
                       onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Feedbacks()),
  );
},
                        
                        child: Icon(Icons.analytics_outlined, color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Text('Feedback')
                      ],),

                      //Registration
                       Column(children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Registration()));
                        },
                        child: Icon(Icons.info_outline, color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Text('Registration')
                      ],),
                    ],
                  ),


                  // third row
                  SizedBox(height: 50,),
                  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      
                    

                      // News(unoff) Button
                       Column(children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => wallpaperPage('')));
                        },
                        
                        child: Icon(Icons.library_books,color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Text('News(unoff)')
                      ],),


                      // Calculator Button
                       Column(children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => wallpaperPage('')));
                        },
                        
                      child: Icon(Icons.calculate, color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Text('Calculator')
                      ],),

                      //Sentiments button
                       Column(children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Article('')));
                        },
                        child: Icon(Icons.sentiment_very_satisfied, color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(15),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Text('Sentiments')
                      ],),
                    ],
                  ),
                      
                    ],)
                  
                  
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
