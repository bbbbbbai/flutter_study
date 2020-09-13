import 'package:redux/redux.dart';

enum Actions { login, logout }

class LoginState {
  String authorizationToken;

  // 获取当前是否处于已认证状态
  get authed => authorizationToken.length > 0;

  LoginState({this.authorizationToken});
  static initialState() {
    return LoginState(authorizationToken: "");
  }
}

// 使用combineReducers关联多个Action的处理方法
Function loginStateReducer = combineReducers<LoginState>([
  TypedReducer<LoginState, LoginStateActionAction>(
      LoginStateActionAction.handler),
]);

// 每次action都包含与之对应的handler，并返回一个新的State
class LoginStateActionAction {
  final Actions actions;

  LoginStateActionAction({this.actions});

  static LoginState handler(LoginState data, LoginStateActionAction action) {
    return LoginState(
        authorizationToken: action.actions == Actions.login ? "登录" : "未登录");
  }
}
