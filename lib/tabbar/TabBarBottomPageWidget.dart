import 'package:flutter/material.dart';
import 'package:flutter_first/tabbar/TabBarPageFirst.dart';
import 'package:flutter_first/tabbar/TabBarPageSecond.dart';
import 'package:flutter_first/tabbar/TabBarPageThree.dart';
import 'package:flutter_first/tabbar/TabBarWidget.dart';

class TabBarBottomPageWidget extends StatefulWidget {
  @override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {
  PageController pageController = new PageController();
  List<String> tab = ["动态", "趋势", "我的"];

  _renderTap() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(
        new FlatButton(
          onPressed: () {
            pageController.jumpTo(MediaQuery.of(context).size.width * i);
          },
          child: new Text(
            tab[i],
            maxLines: 1,
          ),
        ),
      );
    }
    return list;
  }

  _renderPage() {
    return [
      new TabBarPageFirst(),
      new TabBarPageSecond(),
      new TabBarPageThree(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarWidget(
      type: TabBarWidget.BOTTOM_TAB,
      tabItems: _renderTap(),
      tabViews: _renderPage(),
      pageController: pageController,
      backgroundColor: Colors.black45,
      indicatorColor: Colors.white,
      title: new Text("TabBarBottomPageWidget"),
    );
  }
}
