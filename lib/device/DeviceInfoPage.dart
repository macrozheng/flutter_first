import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  String androidModel = "";

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DeviceInfoPage"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: new Text(
          androidModel,
          style: new TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
//    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    setState(() {
      androidModel = androidInfo.model;
    });
  }
}
