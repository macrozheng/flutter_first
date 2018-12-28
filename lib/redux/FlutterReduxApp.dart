import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { Increment }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  return state;
}

// ignore: must_be_immutable
class FlutterReduxApp extends StatelessWidget {
  Store<int> store = new Store(counterReducer, initialState: 0);
  String title = "FlutterReduxApp";

  FlutterReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<int>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.dark(),
        title: title,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text("You have pushed the button this many times:"),
                new StoreConnector<int, String>(
                  builder: (context, count) {
                    return new Text(
                      count,
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                  converter: (store) => store.state.toString(),
                )
              ],
            ),
          ),
          floatingActionButton: new StoreConnector<int, VoidCallback>(builder: (context, callback) {
            return new FloatingActionButton(
              onPressed: callback,
              tooltip: "increment",
              child: new Icon(Icons.add),
            );
          }, converter: (store) {
            return () => store.dispatch(Actions.Increment);
          }),
        ),
      ),
    );
  }
}
