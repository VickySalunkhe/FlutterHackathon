import 'package:flutter/material.dart';
import '../../flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constant_values.dart';
import 'dart:math';
import '../post.dart';
import 'post_final.dart';


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
    _initializeData(20);
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
                    return Tab(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image.asset(
                          ConstantValues.getUserImage(),
                          width: 50,
                          height:50,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
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
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: postData.length,
      itemBuilder: (BuildContext context, int index) => PostBody(),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 0.0,
    );
  }
}
