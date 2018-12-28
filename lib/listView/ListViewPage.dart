import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewPage"),
      ),
      backgroundColor: Colors.blue,
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return listItem();
        },
        itemCount: 20,
      ),
    );
  }

  Container listItem() {
    return new Container(
      child: Card(
        child: FlatButton(
          onPressed: () {
            print("被点击了");
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    "这是一点描述",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  margin: new EdgeInsets.only(top: 6, bottom: 2),
                  alignment: Alignment.topLeft,
                ),
                new Padding(padding: EdgeInsets.all(10)),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getBottomItem(Icons.star, '1000'),
                    _getBottomItem(Icons.link, '1000'),
                    _getBottomItem(Icons.subject, '1000'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getBottomItem(IconData icon, String text) {
    return new Expanded(
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //设置图标及颜色
            new Icon(icon, size: 16.0, color: Colors.grey),
            //设置间距
            new Padding(padding: new EdgeInsets.only(left: 5.0)),
            //设置文本及样式
            new Text(
              text,
              style: new TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
