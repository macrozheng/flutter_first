import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FlutterSwiperPage extends StatefulWidget {
  @override
  _FlutterSwiperPageState createState() => _FlutterSwiperPageState();
}

class _FlutterSwiperPageState extends State<FlutterSwiperPage> {
  static const List<String> images = [
    "assets/gallery1.jpeg",
    "assets/gallery2.jpeg",
    "assets/gallery3.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterSwiperPage"),
      ),
      body: Container(
        child: Swiper(
          itemBuilder: (context, index) {
            return Image.asset(
              images[index],
              fit: BoxFit.cover,
            );
          },
          itemCount: images.length,
          pagination: SwiperPagination(),
          controller: SwiperController(),
        ),
        height: 200,
      ),
    );
  }
}
