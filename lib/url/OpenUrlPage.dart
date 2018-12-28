import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUrlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          onPressed: _launchUrl,
          child: new Text("Show Flutter homepage"),
        ),
      ),
    );
  }
  _launchUrl() async{
    const url = 'https://flutter.io';
    if(await canLaunch(url)){
        await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
}
