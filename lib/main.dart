import 'package:flutter/material.dart';
import 'package:omobiofluttertest/Screens/Home/home_page.dart';
import 'package:omobiofluttertest/Screens/Login/login_page.dart';
import 'package:omobiofluttertest/Screens/splash_screen.dart';

void main() => runApp(new MyApp());

final routes = {
  '/': (BuildContext context) => new SplashScreen(),
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/post': (BuildContext context) => new HomePage(),

};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omobio flutter test',
      routes: routes,
    );
  }
}
