import 'package:flutter/material.dart';

class TabBarPageSecond extends StatefulWidget {
  @override
  _TabBarPageSecondState createState() => _TabBarPageSecondState();
}

class _TabBarPageSecondState extends State<TabBarPageSecond> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("TabBarPageSecond"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}