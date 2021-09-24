import 'package:flutter/material.dart';

import 'package:signalapp/main.dart';
import 'package:signalapp/pages/feedback.dart';
import 'package:signalapp/pages/login.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        
        child: Drawer(
          
          child: ListView(
            children: <Widget>[
              
              UserAccountsDrawerHeader(
                  arrowColor: Colors.black,
                  accountName: Text('Nick Shrestha'),
                  accountEmail: Text('lihkinshrestha@gmail.com'),
                  
                ),
              
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage(title: '',))),
              ),
              
              ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings),
                onTap: () => Navigator.pushReplacementNamed(context, 'Setting'),
              ),
              ListTile(
                title: Text('Feedback'),
                leading: Icon(Icons.person),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Feedbacks()))
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen())),
              ),
               
            ],
          ),
        ),
      ),
    );
  }
}
