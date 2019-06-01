import 'package:flutter/material.dart';
import '../constant_values.dart';

class PostFinal extends StatefulWidget {
  @override
  _PostFinalState createState() => _PostFinalState();
}

class _PostFinalState extends State<PostFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Title"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 16.0,),
          Image.asset(ConstantValues.getPostImage()),
          SizedBox(height: 16.0,),
          Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0 ),
              child: Row(children: <Widget>[
                Icon(Icons.favorite,color: ConstantValues.darkColor,),
                SizedBox(width: 5.0,),
                Text("16"),
                SizedBox(width: 8.0,),
                Icon(Icons.comment,color: ConstantValues.darkColor),
                SizedBox(width: 5.0,),
                Text("10"),
              ],),
            ),
            SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0),
              child: Text(ConstantValues.randomLongText),
            )

        ],
      ),
    );
  }
}