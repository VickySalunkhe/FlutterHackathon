import 'package:flutter/material.dart';
import '../constant_values.dart';

class ProfileScreen extends StatefulWidget {
  final int userID;
  ProfileScreen({this.userID});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _profileDescTextShowFlag = false;
  bool _otherUser = false;
  bool _followed = false;
  bool _blocked = false;
  bool _followNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserName"),
        actions: <Widget>[
          new Icon(Icons.share),
          new GestureDetector(
            onTap: () {
              !_otherUser
                  ? _currentUserOptionsDialog()
                  : _otherUserOptionsDialog();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 12.0, right: 16.0),
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      body: _upperBodyView(),
    );
  }

  _twoRowText(String textTop, String textBottom) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          textTop,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        Text(
          textBottom,
          style: TextStyle(
              color: Color.fromRGBO(132, 134, 136, 1), fontSize: 14.0),
        )
      ],
    );
  }

  _unfollowUserDialog(userName) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Wrap(
              children: <Widget>[
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Are you sure you want to unfollow ",
                      style: TextStyle(color: Colors.black54, fontSize: 16.0),
                    ),
                    TextSpan(
                        text: userName + "?",
                        style: TextStyle(color: Colors.black, fontSize: 16.0))
                  ]),
                )
              ],
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  OutlineButton(
                    borderSide: BorderSide(color: Colors.red),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        _followed = false;
                      });
                    },
                    child: Text(
                      "Unfollow",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }

  _currentUserOptionsDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  //     Routes.launchEditProfilePage(context, userID);
                },
                child:
                    ConstantValues.iconOptionText(Icons.edit, "Edit Profile"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  //     Routes.launchSettingPage(context, userID);
                },
                child:
                    ConstantValues.iconOptionText(Icons.settings, "Settings"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  //    Routes.launchCommunityPage(context);
                },
                child: ConstantValues.iconOptionText(Icons.group, "Community"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  //    Routes.launchSupportPage(context);
                },
                child: ConstantValues.iconOptionText(
                    Icons.perm_data_setting, "Support"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  //   Routes.launchAboutPage(context);
                },
                child: ConstantValues.iconOptionText(Icons.info, "About"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _otherUser = !_otherUser;
                  });
                },
                child: ConstantValues.iconOptionText(
                    Icons.swap_horizontal_circle, "Switch User"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    ConstantValues.iconOptionText(Icons.exit_to_app, "Log out"),
              ),
            ],
          );
        });
  }

  _otherUserOptionsDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: ConstantValues.iconOptionText(
                    Icons.content_copy, "Copy Url"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  //   _userReportDialog();
                },
                child: ConstantValues.iconOptionText(Icons.report, "Report"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  //    if (!_blocked) _blockUserDialog("Pranay Salunkhe");
                },
                child: ConstantValues.iconOptionText(Icons.block, "Block"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _otherUser = !_otherUser;
                  });
                },
                child: ConstantValues.iconOptionText(
                    Icons.swap_horizontal_circle, "Switch User"),
              ),
            ],
          );
        });
  }

  _upperBodyView() {
    return Container(
        margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _twoRowText("12k", "Followers"),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: Image.asset(ConstantValues.getUserImage(),fit: BoxFit.fill,
                  width: 100.0,height:100.0,),

                ),
                _twoRowText("120", "Following")
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: <Widget>[
                ConstantValues.title(
                    "Vicky Salunkhe", Colors.black, FontWeight.w500, 18.0),
                SizedBox(
                  height: 4.0,
                ),
                Text("Joined on 1 March 2019",
                    style: TextStyle(color: Colors.black54, fontSize: 14.0)),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    !_otherUser
                        ? SizedBox()
                        : !_followed
                            ? SizedBox()
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _followNotification = !_followNotification;
                                  });
                                },
                                child: Card(
                                    elevation: 2.0,
                                    color: _followNotification
                                        ? Colors.white
                                        : ConstantValues.darkColor,
                                    child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(
                                          _followNotification
                                              ? Icons.notifications_active
                                              : Icons.notifications,
                                          size: 22.0,
                                          color: _followNotification
                                              ? ConstantValues.darkColor
                                              : Colors.white,
                                        ))),
                              ),
                    !_otherUser
                        ? MaterialButton(
                            height: 30.0,
                            onPressed: () {
                              // Routes.launchEditProfilePage(context, userID);
                            },
                            color: Colors.white,
                            textColor: ConstantValues.midColor,
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          )
                        : !_blocked
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _followed
                                        ? _unfollowUserDialog("Pranay Salunkhe")
                                        : _followed = true;
                                  });
                                },
                                child: Card(
                                    elevation: 2.0,
                                    color: _followed
                                        ? Colors.white
                                        : ConstantValues.darkColor,
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left: 5.0,
                                            right: 5.0,
                                            top: 3.0,
                                            bottom: 3.0),
                                        child: Text(
                                          _followed ? "Following" : "Follow",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: _followed
                                                  ? ConstantValues.darkColor
                                                  : Colors.white),
                                        ))),
                              )
                            : GestureDetector(
                                onTap: () {
                                  //_unblockUserDialog("Pranay Salunkhe");
                                },
                                child: Card(
                                  elevation: 2.0,
                                  color: Colors.white,
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          left: 5.0,
                                          right: 5.0,
                                          top: 3.0,
                                          bottom: 3.0),
                                      child: Text(
                                        "UnBlock",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.green),
                                      )),
                                ),
                              )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              width: ConstantValues.getWidth(context),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black)
              // ),

              child: Text(
                "The road is long 🛣️" +
                    "\nKeep on walking🚶" +
                    "\nUntil you find your destiny🌍🏝️🏞️🏔️",
                maxLines: _profileDescTextShowFlag ? null : 2,
                textAlign: TextAlign.start,
                style: TextStyle(height: 1.15),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _profileDescTextShowFlag = !_profileDescTextShowFlag;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      _profileDescTextShowFlag
                          ? Icons.remove_circle_outline
                          : Icons.add_circle_outline,
                      size: 14,
                      color: ConstantValues.midColor,
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      _profileDescTextShowFlag ? "Show Less" : "Show More",
                      style: TextStyle(
                          fontSize: 12.0, color: ConstantValues.midColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
