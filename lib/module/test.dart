// module/test.dart
import 'package:my_app/store/index.dart';
import 'package:redux/redux.dart';

class TestState {
  int count = 0;
  TestState({this.count});

  static initialState() {
    return TestState(count: 0);
  }
}

// 使用combineReducers关联多个Action的处理方法
Function testReducer = combineReducers<TestState>([
  TypedReducer<TestState, TestAction>(TestAction.handler),
]);

// 每次action都包含与之对应的handler，并返回一个新的State
class TestAction {
  final int count;

  TestAction({this.count});
  // IncrementAction的处理逻辑

  static TestState handler(TestState data, TestAction action) {
    // Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    // prefs.setInt("", 1);
    return TestState(count: data.count + action.count);
  }
}

///实现异步
Future<Function> testActionAsync({Store<AppState> store}) async {
  final int count = await Future.delayed(
    Duration(seconds: 5),
    () => 5,
  );
  return store.dispatch(TestAction(count: count));
}
