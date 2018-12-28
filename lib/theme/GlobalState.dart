import 'package:flutter_first/json/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first/theme/LocaleReducer.dart';
import 'package:flutter_first/theme/ThemeDataReducer.dart';
import 'package:flutter_first/theme/UserReducer.dart';

class GlobalState {
  User userInfo;
  ThemeData themeData;
  Locale locale;

  GlobalState({this.userInfo, this.themeData, this.locale});
}

GlobalState appReducer(GlobalState state, action) {
  return new GlobalState(
    userInfo: UserReducer(state.userInfo, action),
    themeData: ThemeDataReducer(state.themeData, action),
    locale: LocaleReducer(state.locale, action),
  );
}
