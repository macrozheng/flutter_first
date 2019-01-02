import 'package:flutter/material.dart';
import 'package:flutter_first/connect/ConnectivityPage.dart';
import 'package:flutter_first/container/ContainerPage.dart';
import 'package:flutter_first/device/DeviceInfoPage.dart';
import 'package:flutter_first/eventbus/EventBusPage.dart';
import 'package:flutter_first/expanded/ExpandedPage.dart';
import 'package:flutter_first/listView/ListViewPage.dart';
import 'package:flutter_first/localization/DemoLocalizations.dart';
import 'package:flutter_first/localization/DemoLocalizationsDelegate.dart';
import 'package:flutter_first/localization/FreeLocalizationsPage.dart';
import 'package:flutter_first/model/ScopedModelPage.dart';
import 'package:flutter_first/other/ExitPage.dart';
import 'package:flutter_first/other/KeyBordPage.dart';
import 'package:flutter_first/other/LifeCirclePage.dart';
import 'package:flutter_first/packageinfo/PackageInfoPage.dart';
import 'package:flutter_first/path/PathProviderPage.dart';
import 'package:flutter_first/permission/PermissionHandlerPage.dart';
import 'package:flutter_first/photoview/PhotoViewPage.dart';
import 'package:flutter_first/redux/FlutterReduxApp.dart';
import 'package:flutter_first/refresh/RefreshListPage.dart';
import 'package:flutter_first/share/SharePage.dart';
import 'package:flutter_first/sp/SharedPreferencesPage.dart';
import 'package:flutter_first/spinkit/FlutterSpinkitPage.dart';
import 'package:flutter_first/statusbar/StatusBarPage.dart';
import 'package:flutter_first/svg/FlutterSvgPage.dart';
import 'package:flutter_first/tabbar/TabBarBottomPageWidget.dart';
import 'package:flutter_first/tabbar/TabBarTopPageWidget.dart';
import 'package:flutter_first/toast/ToastPage.dart';
import 'package:flutter_first/url/OpenUrlPage.dart';
import 'package:flutter_first/webview/WebViewPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return DemoLocalizations.of(context).mainTitle;
      },
      home: new MainPage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DemoLocalizationsDelegate.delegate
      ],
      supportedLocales: [
        const Locale("zh", "CN"),
        const Locale("en", "US"),
      ],
    );
  }
}

class MainPage extends StatelessWidget {
  final List<Widget> routeWidgets = [
    new ContainerPage(),
    new ExpandedPage(),
    new ListViewPage(),
    new TabBarBottomPageWidget(),
    new TabBarTopPageWidget(),
    new FlutterReduxApp(),
    new ExitPage(),
    new KeyBordPage(),
    new LifeCirclePage(),
    new SharedPreferencesPage(),
    new ToastPage(),
    new DeviceInfoPage(),
    new ConnectivityPage(),
    new OpenUrlPage(),
    new SharePage(),
    new FlutterSpinkitPage(),
    new WebViewPage(),
    new StatusBarPage(),
    new FlutterSvgPage(),
    new PhotoViewPage(),
    new EventBusPage(),
    new PathProviderPage(),
    new PermissionHandlerPage(),
    new ScopedModelPage(),
    new PackageInfoPage(),
    new RefreshListPage(),
    new FreeLocalizationsPage(),
  ];
  final List<String> routeWidgetTitles = [
    "Container的使用",
    "Column及Expanded的使用",
    "ListView的使用",
    "底部TabBar的使用",
    "顶部TabBar的使用",
    "Redux的基本使用",
    "返回按钮监听",
    "键盘焦点处理",
    "前后台监听",
    "shared_preferences的使用",
    "fluttertoast的使用",
    "device_info的使用",
    "connectivity的使用",
    "url_launcher的使用",
    "share的使用",
    "flutter_spinkit的使用",
    "flutter_webview_plugin的使用",
    "获取StatusBar的高度",
    "svg图标加载",
    "photo_view的使用",
    "event_bus的使用",
    "path_provider的使用",
    "permission_handler的使用",
    "scoped_model的使用",
    "package_info的使用",
    "RefreshIndicator及dio的综合应用",
    "Localizations的使用",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(DemoLocalizations.of(context).mainTitle),
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return _getItem(context, index);
        },
        itemCount: routeWidgets.length,
      ),
    );
  }

  Widget _getItem(BuildContext context, int index) {
    Widget routeWidget = routeWidgets[index];
    String title = routeWidgetTitles[index];
    routeWidget.toString();
    FlatButton flatButton = new FlatButton(
      onPressed: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => routeWidget));
      },
      child: new Text(title),
    );
    return new Container(
      child: flatButton,
      alignment: Alignment.centerLeft,
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            color: Colors.black45,
            width: 1,
          ),
        ),
      ),
    );
  }
}
