import 'package:flutter/material.dart';
import 'package:signalapp/pages/news.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              borderRadius: BorderRadius.circular(20.0),
              hoverColor: Colors.black26,
              child: Text("Go to Home Screen",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontStyle: FontStyle.italic, 
                ),
                ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => wallpaperPage('Wallpaper')));
              },
            )
          ],
        ),
      ),
    );
  }
}
