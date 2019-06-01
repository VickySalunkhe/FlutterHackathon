import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sprinters',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.white,
        primaryIconTheme: new IconThemeData(color: Colors.black)
      ),
      home: SplashScreen(),
    );
  }
}

