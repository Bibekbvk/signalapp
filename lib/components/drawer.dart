import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practiceapp2/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("anuzsubedi@hotmail.com"),
            accountName: Text("Anuz Subedi"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context,MyRoutes.loginRoute );
            },
            leading: Icon(CupertinoIcons.lock),
            title: Text("Login"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context,MyRoutes.signupRoute );
            },
            leading: Icon(CupertinoIcons.lock_open),
            title: Text("SignUp"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context,MyRoutes.homeRoute );
            },
            leading: Icon(CupertinoIcons.home),
            title: Text("Home"),
          ),
        ],
      ),
    );
  }
}