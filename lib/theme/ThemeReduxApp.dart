import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first/json/user.dart';
import 'package:flutter_first/theme/GlobalColors.dart';
import 'package:flutter_first/theme/GlobalState.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ThemeReduxApp extends StatelessWidget {
  final Store<GlobalState> store = new Store(
    appReducer,
    initialState: new GlobalState(
        userInfo: User.empty(),
        themeData: new ThemeData(primarySwatch: GlobalColors.primarySwatch),
        locale: new Locale("zh", "CH")),
  );

  ThemeReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new StoreBuilder<GlobalState>(builder: (context, store) {
          return new MaterialApp(
            theme: store.state.themeData,
          );
        }));
  }
}
