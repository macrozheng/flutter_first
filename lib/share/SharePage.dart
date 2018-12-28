import 'package:flutter/material.dart';
import 'package:share/share.dart';
class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          onPressed: _shareUrl,
          child: new Text("share"),
        ),
      ),
    );
  }
  _shareUrl(){
    const url = 'https://flutter.io';
    Share.share(url);
  }
}
