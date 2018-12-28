import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlutterSvgPage extends StatelessWidget {
  final String assetName = 'assets/mall.svg';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          width: 60,
          height: 60,
          child: SvgPicture.asset(
            assetName,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
