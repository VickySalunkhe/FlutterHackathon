import "package:flutter/material.dart";
import 'dart:async';
import 'src/Main/main.dart';

class SplashScreen extends StatefulWidget {
  final Widget child;

  SplashScreen({Key key, this.child}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    new Timer(new Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/test_mode_logo.png",
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.scaleDown),
      ),
    );
  }
}
