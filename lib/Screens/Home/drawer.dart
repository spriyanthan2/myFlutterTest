import 'package:flutter/material.dart';
import 'package:omobiofluttertest/Screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {

  // A Separate Function called for drawer
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        right: false,
        child: Container(
          color: Colors.blueAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Feed"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Notification"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Messages"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Setting"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Logout"),
                onTap: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.clear();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      settings: RouteSettings(name: "/"),
                      builder: (context) => SplashScreen(),
                    ),
                  );
                  Navigator.of(context).popUntil(ModalRoute.withName("/"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
