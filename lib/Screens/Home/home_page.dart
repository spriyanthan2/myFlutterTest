import 'package:omobiofluttertest/Screens/Home/drawer.dart';
import 'package:omobiofluttertest/Screens/Home/empty.dart';
import 'package:omobiofluttertest/Screens/Home/feed.dart';
import 'package:omobiofluttertest/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements AuthStateListener {
  var username;
  bool isLoading = true;
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  _HomePageState() {
    // will be used if logout function is in home screen
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: MyDrawer(),
        key: scaffoldKey,
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.ac_unit,
                            color:
                                _selectedIndex == 0 ? Colors.blue : Colors.grey,
                            size: 35,
                          )
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                        _pageController.jumpToPage(0);
                      }),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                        _pageController.jumpToPage(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.satellite,
                            color:
                                _selectedIndex == 1 ? Colors.blue : Colors.grey,
                            size: 35,
                          )
                        ],
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                        _pageController.jumpToPage(2);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color:
                                _selectedIndex == 2 ? Colors.blue : Colors.grey,
                            size: 35,
                          )
                        ],
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                        _pageController.jumpToPage(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wallpaper,
                            color:
                                _selectedIndex == 3 ? Colors.blue : Colors.grey,
                            size: 35,
                          )
                        ],
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 4;
                        });
                        _pageController.jumpToPage(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard,
                            color:
                                _selectedIndex == 4 ? Colors.blue : Colors.grey,
                            size: 35,
                          )
                        ],
                      )),
                ],
              ),
            )),
        body:  PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: <Widget>[
                  Feed(),
                  Empty(),
                  Empty(),
                  Empty(),
                  Empty(),
                ],
                onPageChanged: (page) {
                  setState(() {
                    _selectedIndex = page;
                  });
                }));
  }

  @override
  void onAuthStateChanged(AuthState state) {
    print('onAuthStateChanged');

    if (state == AuthState.LOGGED_IN) {
      Navigator.of(context).pushReplacementNamed("/home");
    } else if (state == AuthState.LOGGED_OUT)
      Navigator.of(context).popAndPushNamed("/login");
  }
}
