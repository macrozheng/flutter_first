import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SharedPreferencesPage"),
      ),
      body: new RaisedButton(
        onPressed: _incrementCount,
        child: new Text("Increment Counter"),
      ),
    );
  }

  _incrementCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt("counter")??0)+1;
    print("Pressed $counter times!");
    await prefs.setInt("counter", counter);
  }
}
