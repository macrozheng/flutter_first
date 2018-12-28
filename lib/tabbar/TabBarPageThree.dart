import 'package:flutter/material.dart';

class TabBarPageThree extends StatefulWidget {
  @override
  _TabBarPageThreeState createState() => _TabBarPageThreeState();
}

class _TabBarPageThreeState extends State<TabBarPageThree> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("TabBarPageThree"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}