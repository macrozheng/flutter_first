import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("ContainerPage"),
        ),
        body: new Container(
            //四周大小为10的margin
            margin: EdgeInsets.all(10),
            height: 120,
            width: 500,
            //背景装饰
            decoration: new BoxDecoration(
                //圆角
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                //背景色
                color: Colors.blue,
                //边框
                border: new Border.all(color: Colors.white, width: 0.5)),
            child:
                new Text("666666", style: new TextStyle(color: Colors.white))));
  }
}
