import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  FlutterWebviewPlugin _flutterWebviewPlugin = new FlutterWebviewPlugin();
  @override
  void initState() {
    super.initState();
    _flutterWebviewPlugin.onUrlChanged.listen((url){
      print("onUrlChanged:$url");
    });
  }
  @override
  void dispose() {
    super.dispose();
    _flutterWebviewPlugin.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: "https://flutterchina.club/",
      appBar: new AppBar(
        title: new Text("WebViewPage"),
      ),
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      hidden: true,
      initialChild: new Container(
        child: Center(
          child: SpinKitRotatingCircle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
