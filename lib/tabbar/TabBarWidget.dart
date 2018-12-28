import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabBarWidget extends StatefulWidget {
  static const int BOTTOM_TAB = 1;
  static const int TOP_TAB = 2;
  int type;
  PageController pageController;
  List<Widget> tabItems;
  List<Widget> tabViews;
  Widget title;
  Color backgroundColor;
  Color indicatorColor;

  TabBarWidget(
      {Key key,
      this.type,
      this.pageController,
      this.tabItems,
      this.tabViews,
      this.title,
      this.backgroundColor,
      this.indicatorColor})
      : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState(
      this.type,
      this.pageController,
      this.tabItems,
      this.tabViews,
      this.title,
      this.backgroundColor,
      this.indicatorColor);
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  int _type;
  TabController _tabController;
  PageController _pageController;
  List<Widget> _tabItems;
  List<Widget> _tabViews;
  Widget _drawer;
  Widget _floatingActionButton;
  Widget _title;
  Color _backgroundColor;
  Color _indicatorColor;

  _TabBarWidgetState(this._type, this._pageController, this._tabItems,
      this._tabViews, this._title, this._backgroundColor, this._indicatorColor);

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this._type == TabBarWidget.BOTTOM_TAB) {
      return new Scaffold(
        drawer: _drawer,
        floatingActionButton: _floatingActionButton,
        appBar: new AppBar(
          title: _title,
          backgroundColor: _backgroundColor,
        ),
        body: new PageView(
          controller: _pageController,
          children: _tabViews,
          onPageChanged: (index) {
            _tabController.animateTo(index);
          },
        ),
        bottomNavigationBar: new Material(
          color: _backgroundColor,
          child: new TabBar(
            tabs: _tabItems,
            controller: _tabController,
            indicatorColor: _indicatorColor,
          ),
        ),
      );
    } else {
      return Scaffold(
        drawer: _drawer,
        floatingActionButton: _floatingActionButton,
        appBar: new AppBar(
          backgroundColor: _backgroundColor,
          title: _title,
          bottom: new TabBar(
            tabs: _tabItems,
            isScrollable: true,
            controller: _tabController,
            indicatorColor: _indicatorColor,
          ),
        ),
        body: new PageView(
          controller: _pageController,
          children: _tabViews,
          onPageChanged: (index) {
            _tabController.animateTo(index);
          },
        ),
      );
    }
  }
}
