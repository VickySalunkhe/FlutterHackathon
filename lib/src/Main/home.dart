import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constant_values.dart';
import 'dart:math';
import '../post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var rng = new Random();
  List<Post> postData = new List<Post>();

  _initializeData(count) {
    for (int i = 0; i < count; i++) {
      int _postType = 1 + rng.nextInt(3);
      postData.add(Post(postID: rng.nextInt(10), postType: _postType));
    }
  }

  @override
  void initState() {
    _initializeData(50);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ConstantValues.tabList.length,
      child: new Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: new AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Flutter Sprinters',
                style: new TextStyle(
                    fontSize: 25.0,
                    fontFamily: "Billabong",
                    color: Colors.black),
              ),
              actions: <Widget>[
                /*IconButton(
                  icon: Icon(
                    FontAwesomeIcons.trophy,
                    color: ConstantValues.darkColor,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      updateAvailable = !updateAvailable;
                      _newUpdateDialog();
                    });
                  },
                )*/
              ],
              bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: ConstantValues.tabList.map((category) {
                    return Tab(child: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),);
                  }).toList()),
              centerTitle: true,
              backgroundColor: ConstantValues.appBarBG),
          body: Container(
            padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
            height: ConstantValues.getHomePageRemainingHeight(context),
            child: TabBarView(
              children: ConstantValues.tabList
                  .map((category) => _getListView(category))
                  .toList(),
            ),
          )),
    );
  }

  Widget _getListView(category) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (BuildContext context, int index){
        return PostBody();
      },
    );
  }
}
