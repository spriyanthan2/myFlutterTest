import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omobiofluttertest/Screens/Home/drawer.dart';
import 'package:omobiofluttertest/Screens/Profile/profile.dart';

class Feed extends StatelessWidget {
  List<String> items = ["1", "2", "3", "4"];

  // A Separate Function called from itemBuilder
  Widget buildBody(BuildContext ctxt, int index) {
    return new Center(
        child: Container(
      padding: new EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: const ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 60,
                  color: Colors.blueAccent,
                ),
                title: Text('Name Surname',
                    style: TextStyle(fontSize: 30.0, color: Colors.blueAccent)),
                subtitle:
                    Text("1hr ago", style: TextStyle(color: Colors.blueAccent)),
              ),
              onTap: () {
                Navigator.push(
                  ctxt,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "you're looking for random paragraphs, you've come to the right place. When a random word or a random sentence isn't quite enough, the next logical step is to find a random paragraph. We created the Random Paragraph Generator with you in mind.",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: const Text('View'),
                  onPressed: () {
                    Navigator.push(
                      ctxt,
                      MaterialPageRoute(builder: (context) => Post()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Feed'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext ctxt, int index) =>
                buildBody(ctxt, index)),
      ),
    );
  }
}


class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "A heading is very similar to a title.",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "you're looking for random paragraphs, you've come to the right place. When a random word or a random sentence isn't quite enough, the next logical step is to find a random paragraph. We created the Random Paragraph Generator with you in mind.",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      "June 2,2017",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
