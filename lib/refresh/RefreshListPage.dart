import 'package:flutter/material.dart';
import 'package:flutter_first/refresh/CommonStyle.dart';
import 'package:flutter_first/refresh/DaoResult.dart';
import 'package:flutter_first/refresh/ListState.dart';
import 'package:dio/dio.dart';
import 'package:flutter_first/refresh/PullLoadWidget.dart';

class RefreshListPage extends StatefulWidget {
  @override
  _RefreshListPageState createState() => _RefreshListPageState();
}

class _RefreshListPageState extends State<RefreshListPage>
    with AutomaticKeepAliveClientMixin<RefreshListPage>, ListState<RefreshListPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RefreshListPage"),
      ),
      body: new PullLoadWidget((BuildContext context, int index) => _renderItem(index), onLoadMore,
          handleRefresh, pullLoadWidgetControl, refreshIndicatorKey),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  requestRefresh() async {
    return await _getData();
  }

  @override
  requestLoadMore() async {
    return await _getData();
  }

  @override
  bool get isRefreshFirst => true;

  @override
  bool get needHeader => false;

  _getData() async {
    int pageSize = ListState.PAGE_SIZE;
    String url = "http://39.98.69.210:8080/coupon/list?pageNum=$page&pageSize=$pageSize";
    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.get(url);
    } on DioError catch (e) {
      print(e.toString());
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = response.data["data"]["list"];
      List<CouponViewModel> list = new List();
      for (int i = 0; i < data.length; i++) {
        list.add(new CouponViewModel.fromJson(data[i]));
      }
      return new DataResult(list, true);
    }
  }

  Widget _renderItem(int index) {
    if (pullLoadWidgetControl.dataList.length == 0) {
      return null;
    }
    CouponViewModel data = pullLoadWidgetControl.dataList[index];
    var amount = data.amount;
    var minPoint = data.minPoint;
    var name = data.name;
    var platform = data.platform == 0 ? "全平台" : (data.platform == 1 ? "移动" : "PC");
    DateTime dateTime = new DateTime.fromMillisecondsSinceEpoch(data.endTime);
    var year = dateTime.year;
    var month = dateTime.month;
    var day = dateTime.day;
    String endTime = "$year-$month-$day";
    return Container(
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(width: 1, color: new Color(CommonColors.divideColor)))),
      child: new Row(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(8),
            color: new Color(CommonColors.primaryColor),
            height: 150,
            width: 150,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "￥$amount",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: CommonSize.bigTextSize,
                      fontWeight: FontWeight.bold),
                ),
                new Container(
                  height: 16,
                ),
                new Text(
                  "满$minPoint可用",
                  style: new TextStyle(color: Colors.white, fontSize: CommonSize.normalTextSize),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  name,
                  style: new TextStyle(
                      color: new Color(
                        CommonColors.primaryTextColor,
                      ),
                      fontSize: CommonSize.normalTextSize,
                      fontWeight: FontWeight.bold),
                ),
                new Container(
                  height: 8,
                ),
                new Text(
                  "适用平台：$platform",
                  style: new TextStyle(
                      color: new Color(CommonColors.secondTextColor),
                      fontSize: CommonSize.middleTextWhiteSize),
                ),
                new Container(
                  height: 8,
                ),
                new Text("有效期至：$endTime",
                    style: new TextStyle(
                        color: new Color(CommonColors.secondTextColor),
                        fontSize: CommonSize.middleTextWhiteSize)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CouponViewModel {
  int id;
  String name;
  int count;
  double amount;
  double minPoint;
  int platform;
  int endTime;

  CouponViewModel(
      this.id, this.name, this.count, this.amount, this.minPoint, this.platform, this.endTime);

  factory CouponViewModel.fromJson(Map<String, dynamic> json) {
    return new CouponViewModel(
      json["id"] as int,
      json["name"] as String,
      json["count"] as int,
      json["amount"] as double,
      json["minPoint"] as double,
      json["platform"] as int,
      json["endTime"] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "count": this.count,
    };
  }
}
