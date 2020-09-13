// module/test.dart
import 'package:redux/redux.dart';

class TabState {
  int selectedIndex = 0;

  TabState({this.selectedIndex});

  static initialState() {
    return TabState(selectedIndex: 0);
  }
}

// 使用combineReducers关联多个Action的处理方法
Function tabReducer = combineReducers<TabState>([
  TypedReducer<TabState, IncrementAction>(IncrementAction.handler),
]);

// 每次action都包含与之对应的handler，并返回一个新的State
class IncrementAction {
  final int selectedIndex;

  IncrementAction({this.selectedIndex});
  // IncrementAction的处理逻辑

  static TabState handler(TabState data, IncrementAction action) {
    return TabState(selectedIndex: action.selectedIndex);
  }
}
