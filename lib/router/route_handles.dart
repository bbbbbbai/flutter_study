import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/tab_page.dart';

import '../pages/index1.dart';
import '../pages/index2.dart';
import '../pages/index3.dart';

var home = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabPage();
});

var index1 = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Index1();
});
var index2 = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Index2();
});
var index3 = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Index3();
});
