import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tab_bar/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JDIH Kota Probolinggo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home()
      },
      home: new SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
}

    void navigationPage() {
      Navigator.of(context).pushReplacementNamed('/Home');
    }

    @override
    void initState() {
      super.initState();
      startTime();
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: new Center(
          child: new Image.asset('images/jdih-logo.png',
          ),
        ),
      );
    }
}