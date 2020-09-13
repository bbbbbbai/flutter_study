import 'package:fluro/fluro.dart';

import 'route_handles.dart';

///路由管理
///使用
///Application.router.navigateTo(context,"/b");
class Routers {
  static String homePage = "/"; //需要注意
  static String page_b = "/b/:data";

  static void configureRoutes(Router router) {
    router.define(homePage, handler: home);
    router.define(page_b, handler: index2);
    router.notFoundHandler = index3; //空页面
  }
}
