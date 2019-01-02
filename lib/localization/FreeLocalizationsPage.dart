import 'package:flutter/material.dart';
import 'package:flutter_first/localization/DemoLocalizations.dart';

class FreeLocalizationsPage extends StatefulWidget {
  @override
  _FreeLocalizationsPageState createState() => _FreeLocalizationsPageState();
}

class _FreeLocalizationsPageState extends State<FreeLocalizationsPage> {
  Locale _locale = const Locale('en', 'US');
  bool flag = false;

  changeLocale() {
    Locale locale;
    print(_locale);
    if (flag) {
      locale = const Locale("zh", "CH");
    } else {
      locale = const Locale("en", "US");
    }
    flag = !flag;
    print(locale);
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Localizations.override(
      context: context,
      locale: _locale,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(DemoLocalizations.of(context).localizationTitle),
        ),
        body: new Column(
          children: <Widget>[
            new Text(DemoLocalizations.of(context).languageText),
            new Container(
              height: 16,
            ),
            new RaisedButton(
              onPressed: changeLocale,
              child: new Text(DemoLocalizations.of(context).switchButtonText),
            ),
          ],
        ),
      ),
    );
  }
}