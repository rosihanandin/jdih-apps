import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_splash/animated_splash.dart';

import 'package:tab_bar/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application
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
      home: new SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: Home(), 2: SplashScreen()};

    startTime() async {
    var _duration = new Duration(seconds: 3);
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
        body: AnimatedSplash (
          imagePath: 'images/jdih-logo.png',
          home: SplashScreen(),
          customFunction: duringSplash ,
          duration: 4000,
          type: AnimatedSplashType.BackgroundProcess,
          outputAndHome: op,
        )
      );
    }
}