import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ToastPage"),
      ),
      body: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: _longToast,
              child: new Text("show long toast"),
            ),
            new RaisedButton(
              onPressed: _shortToast,
              child: new Text("show short toast"),
            ),
            new RaisedButton(
              onPressed: _centerToast,
              child: new Text("show center toast"),
            ),
            new RaisedButton(
              onPressed: _coloredToast,
              child: new Text("show colored toast"),
            ),
          ],
        ),
      ),
    );
  }

  void _longToast() {
    Fluttertoast.showToast(
      msg: "this is a long toast",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIos: 1,
    );
  }

  void _shortToast() {
    Fluttertoast.showToast(
      msg: "this is a short toast",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
    );
  }

  void _centerToast() {
    Fluttertoast.showToast(
      msg: "this is a center toast",
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
    );
  }

  void _coloredToast() {
    Fluttertoast.showToast(
      msg: "this is a colored toast",
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white
    );
  }
}
