import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        appBar: new AppBar(
          title: Text("ContainerPage"),
        ),
        body: new Container(
            //四周大小为10的margin
            height: 120,
            width: 360,
            //背景装饰
            decoration: new BoxDecoration(
                //圆角
                //背景色
                color: Colors.blue,
                //边框
                border: new Border.all(color: Colors.white, width: 0.5)),
            child:
                new Text("width:$width height:$height pixelRatio:$pixelRatio", style: new TextStyle(color: Colors.white))));
  }
}
