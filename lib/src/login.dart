import 'package:flutter/material.dart';
import 'package:hackathon/src/constant_values.dart';
import 'loadingGoogle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
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
          SizedBox(
            width: 300,
                      child: RaisedButton.icon(
              color: Colors.blueAccent,
              icon: Icon(FontAwesomeIcons.facebook, size: 18.0,color: Colors.white,),
              label: Text('Sign in with Facebook',style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => LoginGoogleScreen()));
                // Perform some action
              },
            ),
          ),
          SizedBox(height: 20.0,),
          SizedBox(
            width: 300,
            child: RaisedButton.icon(
              color: ConstantValues.darkColor,
              icon: Icon(FontAwesomeIcons.google, size: 18.0,color: Colors.white,),
              label: Text('Sign in with Google',style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => LoginGoogleScreen()));
                // Perform some action
                // Perform some action
              },
            ),
          ),
        ],
      ),
    ));
  }
}
