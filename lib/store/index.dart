import 'package:my_app/common/common_data.dart';
import 'package:my_app/module/loginState.dart';
import 'package:my_app/module/tab.dart';
import 'package:my_app/module/test.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../module/test.dart';

class AppState {
  // 把拆分了TestState和UserState两个state
  TestState test;

  TabState tab;

  LoginState loginState;

  AppState({this.test, this.tab, this.loginState});

  static initialState() {
    // 分别调用子state的initialState方法
    AppState state = AppState(
      test: TestState.initialState(),
      tab: TabState.initialState(),
      loginState: LoginState.initialState(),
    );
    return state;
  }
}

// 全局reducer，每次返回一个新的AppState对象
AppState _reducer(AppState state, dynamic action) {
  return AppState(
    test: testReducer(state.test, action),
    tab: tabReducer(state.tab, action),
    loginState: loginStateReducer(state.loginState, action),
  );
}

// 暴露全局store
Store store = new Store<AppState>(_reducer,
    initialState: AppState.initialState(), middleware: [thunkMiddleware]);
