import 'package:flutter/material.dart';

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
    return _postBody();
  }

  Widget _postBody(){
    return Card(
      elevation: 2,
      child: ListTile(
            leading: Text("12:00 pm"),
            title: Text("Post Title"),
            trailing: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.red,
              ),
            ),
          ),
    );
  }


}