import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbar/flutter_statusbar.dart';

class StatusBarPage extends StatefulWidget {
  @override
  _StatusBarPageState createState() => new _StatusBarPageState();
}

class _StatusBarPageState extends State<StatusBarPage> {
  double _height;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    try {
      _height = await FlutterStatusbar.height;
    } on PlatformException {}
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('StatusBarPage'),
        ),
        body: new Center(
          child: new Text('Statusbar height: $_height\n'),
        ),
      ),
    );
  }
}
