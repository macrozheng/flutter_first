import 'package:flutter/material.dart';

///前后台监听
class LifeCirclePage extends StatefulWidget {
  @override
  _LifeCirclePageState createState() => _LifeCirclePageState();
}

class _LifeCirclePageState extends State<LifeCirclePage> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print(state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LifeCirclePage"),
      ),
      body: new Container(),
    );
  }
}
