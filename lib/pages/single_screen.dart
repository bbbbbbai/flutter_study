import 'package:flutter/material.dart';
import 'package:my_app/router/application.dart';

///启屏页
class SingleScreen extends StatefulWidget {
  @override
  _SingleScreenState createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Container(
      color: Colors.white,
      width: width,
      height: height,
      child: Center(
        child: Text("bilbil"),
      ),
    );
  }

  void initState() {
    super.initState();
    conutDown();
  }

  void conutDown() {
    var _duration = Duration(seconds: 2);
    Future.delayed(_duration, newPage);
  }

  void newPage() {
    Application.router.navigateTo(context, "/");
  }
}
