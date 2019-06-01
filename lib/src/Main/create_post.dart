import 'package:flutter/material.dart';
import '../constant_values.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'image_pick.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _postTypeVal = "Story";
  File _wallpaperImage;
  TextEditingController postBodyTEC = new TextEditingController();
  bool _imageSet = false;
  bool _postUploading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _exitDialog,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(
                "Create $_postTypeVal",
                style: TextStyle(fontSize: ConstantValues.appBarTextSize),
              ),
              actions: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _postUploading = true;
                        _mimicDataUploading();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5),
                        color: Colors.blue,
                      ),
                      margin:
                          EdgeInsets.only(top: 12.0, bottom: 12.0, right: 8.0),
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      alignment: Alignment.center,
                      child: Text("Publish",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ))
              ],
            ),
            body: !_postUploading
                ? _buildBody()
                : ConstantValues.loadingWidget(
                    context, "$_postTypeVal Is Uploading Please Wait...")));
  }

  Future<bool> _exitDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 20.0, left: 16.0, right: 16.0),
                child:
                    Text("Are You Sure You Want To Discard This $_postTypeVal?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                        )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    borderSide: BorderSide(color: Colors.black54),
                    child: Text("Cancel",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  OutlineButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    borderSide: BorderSide(color: Colors.redAccent),
                    child: Text("Discard",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent)),
                  ),
                ],
              )
            ],
          );
        });
    return new Future.value(true);
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              _imagePickDialog();
            },
            child: _wallpaperImage == null
                ? Container(
                    alignment: Alignment.center,
                    width: ConstantValues.postWidth(context),
                    height: _imageSet
                        ? ConstantValues.postHeight(context)
                        : ConstantValues.postHeight(context) * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.photo_size_select_actual,
                          size: 50.0,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Tap to add image",
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                : Container(
                    //width: ConstantValues.postWidth(context),
                    //height: ConstantValues.postHeight(context),
                    child: Image.file(_wallpaperImage, fit: BoxFit.contain),
                  )),
        Container(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                maxLines: null,
                textInputAction: TextInputAction.newline,
                style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Garamond",
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    fillColor: Colors.black12,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    hintStyle: TextStyle(color: Colors.black38),
                    hintText: "Add $_postTypeVal Title"),
              ),
              SizedBox(
                height: 24.0,
              ),
              _postBodyTextField(),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _showSnackbar(msg, error) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        duration: Duration(milliseconds: 1500),
        content: new Text(
          msg,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: error ? Colors.red : Colors.green));
  }
  _mimicDataUploading() async {
    await Future.delayed(const Duration(seconds: 3));

    _postUploading = false;
    setState(() {});
  }

  _languageView(selected, text) {
    return Container(
      height: 35,
      width: 100,
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.green : Colors.black45,
          ),
          borderRadius: BorderRadius.circular(3.0)),
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: selected ? Colors.green : Colors.black45,
              fontSize: 16.0,
              fontWeight: selected ? FontWeight.bold : FontWeight.w400)),
    );
  }
  _postBodyTextField() {
    return LayoutBuilder(builder: (context, size) {
      TextSpan text = new TextSpan(
        text: postBodyTEC.text,
      );

      TextPainter tp = new TextPainter(
        text: text,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
      );
      tp.layout(maxWidth: size.maxWidth);

      int lines = (tp.size.height / tp.preferredLineHeight).ceil();
      int maxLines = 6;

      return TextField(
        controller: postBodyTEC,
        maxLines: lines > maxLines ? null : maxLines,
        textInputAction: TextInputAction.newline,
        style: TextStyle(fontSize: 20.0, fontFamily: "Garamond"),
        maxLength: 15000,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12)),
            hintStyle: TextStyle(color: Colors.black38),
            hintText: "Start Writing your $_postTypeVal here..."),
      );
    });
  }

  _imagePickDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: const Text('Set a profile photo'),
              children: <Widget>[
                new ImagePickDialogItem(
                  icon: Icons.photo_library,
                  color: Colors.black54,
                  text: 'Import from gallery',
                  onPressed: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.gallery);
                  },
                ),
                new ImagePickDialogItem(
                    icon: Icons.photo_camera,
                    color: Colors.black54,
                    text: 'Upload from Camera',
                    onPressed: () {
                      Navigator.pop(context);
                      _getImage(ImageSource.camera);
                    }),
              ]);
        });
  }

  Future<Null> _getImage(sourceType) async {
    File originalImage = await ImagePicker.pickImage(source: sourceType);

/*    _wallpaperImage = await ImageCropper.cropImage(
      sourcePath: originalImage.path,
    );
  */
    _wallpaperImage = originalImage;
    setState(() {});
  }
}
