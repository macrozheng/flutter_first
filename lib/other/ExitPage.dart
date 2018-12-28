import 'package:flutter/material.dart';

///返回按钮监听
class ExitPage extends StatelessWidget {
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            content: new Text("是否退出"),
            actions: [
              new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false), child: new Text("取消")),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: new Text("确定"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HomePage"),
      ),
      body: new WillPopScope(child: new Container(), onWillPop: ()=>_dialogExitApp(context)),
    );
  }
}
