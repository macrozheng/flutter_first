import 'package:flutter/material.dart';

///键盘焦点处理
class KeyBordPage extends StatefulWidget {
  @override
  _KeyBordPageState createState() => _KeyBordPageState();
}

class _KeyBordPageState extends State<KeyBordPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("KeyBordPage"),
      ),
      body: new GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Center(
          child: new Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
