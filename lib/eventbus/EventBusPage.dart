import 'dart:async';

import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_first/eventbus/UserLoggedInEvent.dart';
import 'package:flutter_first/json/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventBusPage extends StatefulWidget {
  @override
  _EventBusPageState createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  EventBus _eventBus = new EventBus();
  StreamSubscription<UserLoggedInEvent> _loginSubscription;

  @override
  void initState() {
    super.initState();
    _loginSubscription = _eventBus.on<UserLoggedInEvent>().listen((event) {
      String name = event.user.name;
      Fluttertoast.showToast(
        msg: name.toString(),
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIos: 1,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _loginSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: new RaisedButton(
          onPressed: _fireEvent,
          child: new Text("点击发出事件"),
        ),
      ),
    );
  }

  void _fireEvent() {
    _eventBus.fire(new UserLoggedInEvent(new User("zhangsan", "10086@qq.com")));
  }
}
