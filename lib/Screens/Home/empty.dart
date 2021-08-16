import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omobiofluttertest/Screens/Home/drawer.dart';

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Title'),
      ),
      drawer:MyDrawer(),
      body: Center(
        child: DecoratedBox( // here is where I added my DecoratedBox
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          child: Text('Comming soon'),
        ),
      ),
    );
  }
}