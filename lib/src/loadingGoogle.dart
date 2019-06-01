import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon/src/Main/main.dart';


class LoginGoogleScreen extends StatefulWidget {
  @override
  _LoginGoogleScreenState createState() => _LoginGoogleScreenState();
}

class _LoginGoogleScreenState extends State<LoginGoogleScreen> {
    @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/sf.png",
                width: MediaQuery.of(context).size.width / 1.5,
                fit: BoxFit.scaleDown),
          ),
          CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
