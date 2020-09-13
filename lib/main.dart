import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:my_app/pages/single_screen.dart';
import 'package:my_app/router/application.dart';
import 'package:my_app/router/routers.dart';

void main() {
  runApp(MyApp());
  Router router = Router();
  Routers.configureRoutes(router);
  Application.router = router;
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //#fb7299
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.white,
        platform: TargetPlatform.android,
      ),
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleScreen(),
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
