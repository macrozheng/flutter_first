import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class PullLoadWidget extends StatefulWidget {
  IndexedWidgetBuilder itemBuilder;
  RefreshCallback onLoadMore;
  RefreshCallback onRefresh;
  PullLoadWidgetControl control;
  Key refreshKey;

  PullLoadWidget(this.itemBuilder, this.onLoadMore, this.onRefresh, this.control, this.refreshKey);

  @override
  _PullLoadWidgetState createState() =>
      _PullLoadWidgetState(itemBuilder, onLoadMore, onRefresh, control, refreshKey);
}

class _PullLoadWidgetState extends State<PullLoadWidget> {
  ScrollController _scrollController = new ScrollController();
  IndexedWidgetBuilder itemBuilder;
  RefreshCallback onLoadMore;
  RefreshCallback onRefresh;
  PullLoadWidgetControl control;
  Key refreshKey;

  _PullLoadWidgetState(
      this.itemBuilder, this.onLoadMore, this.onRefresh, this.control, this.refreshKey);

  @override
  void initState() {
    super.initState();

    ///滑动到底部触发加载更多回调
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (this.control.needLoadMore) {
          this.onLoadMore?.call();
        }
      }
    });
  }

  ///根据配置状态返还实际列表数量
  _getListCount() {
    if (control.needHeader) {
      ///有数据时需要加上头部和加载更多，没有数据时返还头部
      return control.dataList.length > 0
          ? control.dataList.length + 2
          : control.dataList.length + 1;
    } else {
      if (control.dataList.length == 0) {
        ///没数据时返还空白页
        return 1;
      }

      ///返回加上加载更多
      return control.dataList.length + 1;
    }
  }

  ///根据配置状态返还列表Item
  _getItem(index) {
    if (!control.needHeader && control.dataList.length != 0 && index == control.dataList.length) {
      ///不需要头部时，最后一个为加载更多
      return _buildProgressIndicator();
    } else if (control.needHeader &&
        control.dataList.length != 0 &&
        index == control.dataList.length + 1) {
      ///不需要头部时，最后一个为加载更多
      return _buildProgressIndicator();
    } else if (!control.needHeader && control.dataList.length == 0) {
      ///没有数据是显示为空布局
      return _buildEmpty();
    } else {
      ///正常渲染Item
      return itemBuilder(context, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: new ListView.builder(
        ///保持ListView任何情况都能滚动，解决在RefreshIndicator的兼容问题。
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          _getItem(index);
        },
        itemCount: _getListCount(),
        controller: _scrollController,
      ),
      onRefresh: onRefresh,
    );
  }

  ///上拉加载更多
  _buildProgressIndicator() {
    Widget bottomWidget = control.needLoadMore
        ? new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new SpinKitRotatingCircle(
                color: Color(0xFF24292E),
              ),
              new Container(
                width: 5.0,
              ),
              new Text(
                "加载中...",
                style: new TextStyle(
                  color: Color(0xFF121917),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        : new Container();
    return new Padding(
      padding: EdgeInsets.all(20.0),
      child: new Center(
        child: bottomWidget,
      ),
    );
  }

  ///空页面
  _buildEmpty() {
    return new Text("暂无数据");
  }
}

class PullLoadWidgetControl {
  ///数据，对齐增减，不能替换
  List dataList = new List();

  ///是否需要加载更多
  bool needLoadMore = true;

  ///是否需要头部
  bool needHeader = false;
}
