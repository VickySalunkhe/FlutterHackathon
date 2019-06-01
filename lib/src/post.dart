import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathon/src/constant_values.dart';
import 'Main/post_final.dart';
class Post {
  int postID;
  int postType;
  Post({this.postID, this.postType});

  int get getPostID => postID;
  int get getPostType => postType;
}

class PostBody extends StatefulWidget {
  @override
  _PostBodyState createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  @override
  Widget build(BuildContext context) {
    return _post();
  }

  Widget _post() {
    return Card(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new PostFinal()));
        },
        child: Column(
            children: <Widget>[
              Image.asset(ConstantValues.getPostImage()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Icon(Icons.favorite,color: ConstantValues.darkColor,),
                  SizedBox(width: 5.0,),
                  Text("16"),
                  SizedBox(width: 8.0,),
                  Icon(Icons.comment,color: ConstantValues.darkColor),
                  SizedBox(width: 5.0,),
                  Text("10"),
                ],),
              )
            ]),
      ),
    );
  }

  Widget _postBody() {
    return GestureDetector(
      onTap: () {
        print(ConstantValues.getPostImage());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: ListTile(
          leading: Text("12:00 pm"),
          title: Text(
            "Post Title",
            textAlign: TextAlign.center,
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Container(
              width: 50.0,
              height: 50.0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(ConstantValues.getPostImage()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
