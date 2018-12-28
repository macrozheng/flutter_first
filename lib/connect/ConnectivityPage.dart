import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityPage extends StatefulWidget {
  @override
  _ConnectivityPageState createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  String _connectionStatus = 'Unknown';
  Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectionStatus = result.toString();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ConnectivityPage"),
      ),
      body: new Center(
        child: new Text("Connection Status: $_connectionStatus\n"),
      ),
    );
  }

  void initConnectivity() async {
    String connectionStatus;
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } catch (e) {
      print(e);
      connectionStatus = 'Failed to get connectivity.';
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _connectionStatus = connectionStatus;
    });
  }
}
