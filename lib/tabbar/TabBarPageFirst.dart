import 'package:flutter/material.dart';

class TabBarPageFirst extends StatefulWidget {
  @override
  _TabBarPageFirstState createState() => _TabBarPageFirstState();
}

class _TabBarPageFirstState extends State<TabBarPageFirst> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    super.initState();
    print("_TabBarPageFirstState initState()");
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("TabBarPageFirst"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
