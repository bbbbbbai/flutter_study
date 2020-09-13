import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_app/store/index.dart';
import 'package:redux/redux.dart';

typedef MapStateToPropsCallback<S> = void Function(
  Store<AppState> store,
);

typedef BaseViewModelBuilder<ViewModel> = Widget Function(
  BuildContext context,
  ViewModel vm,
  Store<AppState> store,
);

Widget connect(MapStateToPropsCallback mapStateToProps, BaseViewModelBuilder builder) {
  return StoreConnector<AppState, dynamic>(
    converter: mapStateToProps,
    builder: (context, props) {
      // 传入props和store
      return builder(context, props, store);
    },
  );
}
