import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Utils {
  ///启动一个清提示
  static myToast(context, text, {StyledToastAnimation animation = StyledToastAnimation.fade}) {
    showToast(
      text.toString(),
      context: context,
      animation: animation,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    );
  }
}
