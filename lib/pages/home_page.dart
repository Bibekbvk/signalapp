import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practiceapp2/components/drawer.dart';
import 'package:practiceapp2/utils/routes.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          statusBarColor: Colors.black,
        ),
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TextButton(onPressed: () {Navigator.pushNamed(context, MyRoutes.loginRoute);}, child: Text("Login")),
            TextButton(onPressed: () {Navigator.pushNamed(context, MyRoutes.signupRoute);}, child: Text("SignUp")),
          ],
        ),
      ),
    );
  }
}

