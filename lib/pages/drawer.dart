import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:signalapp/main.dart';
import 'package:signalapp/pages/login.dart';
import 'package:signalapp/pages/splash.dart';

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
                  accountName: Text('Pragyan Maharjan'),
                  accountEmail: Text('maharjanpragyan0@gmail.com'),
                  
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
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SplashScreen(duration: 3, goToPage: MyHomePage(title: '',),),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
