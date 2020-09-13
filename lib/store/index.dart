import 'package:flutter/material.dart';
import 'package:my_app/module/tab.dart';
import 'package:my_app/module/test.dart';
import 'package:redux/redux.dart';

import '../module/test.dart';

class AppState {
  // 把拆分了TestState和UserState两个state
  TestState test;

  TabState tab;

  AppState({this.test, this.tab});

  static initialState() {
    // 分别调用子state的initialState方法
    AppState state = AppState(test: TestState.initialState(), tab: TabState.initialState());
    return state;
  }
}

// 全局reducer，每次返回一个新的AppState对象
AppState _reducer(AppState state, dynamic action) {
  return AppState(test: testReducer(state.test, action), tab: tabReducer(state.tab, action));
}

// 暴露全局store
Store store = new Store<AppState>(_reducer, initialState: AppState.initialState());
