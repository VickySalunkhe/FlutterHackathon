import 'package:flutter/material.dart';
import '../BottomNavigationBar/export_bnb.dart';
import 'export_main.dart';
import '../constant_values.dart';
import 'create_post.dart';

class MainScreen extends StatefulWidget {
  final int userID;

  MainScreen({this.userID});

  _MainScreenState createState() => _MainScreenState(userID: this.userID);
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _tabSelected = 0;

  _MainScreenState({this.userID});
  int userID;

  IconData notificationIcon = Icons.notifications_none;
  IconData profileIcon = Icons.person_outline;
  var _layoutType;

  @override
  void initState() {
    userID != null
        ? _layoutType = ProfileScreen(
            userID: userID,
          )
        : _layoutType = HomeScreen();
    super.initState();
  }

  void _selectedTab(int index) {
    setState(() {
      _tabSelected = index;
      switch (_tabSelected) {
        case 0:
          _layoutType = HomeScreen();
          break;
        case 1:
          profileIcon = Icons.person;
          _layoutType = ProfileScreen(userID: 0);
          break;
      }
    });
  }

  void _selectedFab(int index) {
    setState(() {
      print("Fab Selected $index");
    });
  }

  _createPostDialog() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Wrap(children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 24.0, bottom: 20.0),
                alignment: Alignment.center,
                child: ConstantValues.title(
                    "Write a new", Colors.blue, FontWeight.w600, 18.0),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Routes.launchCreateStoryPoemPage(context, 1);
                      },
                      borderSide: BorderSide(color: Colors.green, width: 1.5),
                      highlightedBorderColor: Colors.green,
                      child: Text("Story",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ),
                    OutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                        //  Routes.launchCreateStoryPoemPage(context, 1);
                      },
                      borderSide: BorderSide(color: Colors.green, width: 1.5),
                      highlightedBorderColor: Colors.green,
                      child: Text("Poem",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ),
                    OutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                        //  Routes.launchCreateQuotePage(context);
                      },
                      borderSide: BorderSide(color: Colors.green, width: 1.5),
                      highlightedBorderColor: Colors.green,
                      child: Text("Quote",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              )
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutType,

      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.black54,
        selectedColor: ConstantValues.darkColor,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.home),
          FABBottomAppBarItem(iconData: profileIcon),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: 
          FloatingActionButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new CreatePost()));
          //_createPostDialog();
        },
        child: Icon(
          Icons.mode_edit,
          color: Colors.white,
        ),
        backgroundColor: ConstantValues.darkColor,
        elevation: 10.0,
      ), 
    );
  }
}
