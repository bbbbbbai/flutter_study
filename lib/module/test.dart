// module/test.dart
import 'package:redux/redux.dart';

class TestState {
  int count = 0;

  TestState({this.count});

  static initialState() {
    return TestState(count: 1);
  }
}

// 使用combineReducers关联多个Action的处理方法
Function testReducer = combineReducers<TestState>([
  TypedReducer<TestState, IncrementAction>(IncrementAction.handler),
]);

// 每次action都包含与之对应的handler，并返回一个新的State
class IncrementAction {
  final int payload;

  IncrementAction({this.payload});
  // IncrementAction的处理逻辑

  static TestState handler(TestState data, IncrementAction action) {
    return TestState(count: data.count + action.payload);
  }
}
