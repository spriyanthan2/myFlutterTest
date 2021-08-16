import 'dart:async';
import 'package:omobiofluttertest/utils/device_perference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omobiofluttertest/utils/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    implements AuthStateListener {
  BuildContext _ctx;
  DevicePreference _devicePreference = new DevicePreference();

  _SplashScreenState() {
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return new Scaffold(
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _devicePreference.getDevice() == 'iOS'
                ? CupertinoActivityIndicator()
                : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  @override
  void onAuthStateChanged(AuthState state) {
    // TODO: implement onAuthStateChanged
    Timer(Duration(seconds: 0), () {
      if (state == AuthState.LOGGED_IN) {
        Navigator.of(_ctx).pushReplacementNamed("/home");
      } else {
        Navigator.of(_ctx).pushReplacementNamed("/login");
      }
    });
  }
}
