import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:my_app/store/index.dart';
import '../store/index.dart' as BaseStore;
import '../module/test.dart' as TestModule;
import '../module/tab.dart' as TabModule;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<BaseStore.AppState, dynamic>(
      converter: (store) {
        return store;
      },
      builder: (context, store) {
        return LoadingOverlay(
          isLoading: _isLoading,
          child: Scaffold(
            appBar: backAppbar(context),
            body: Column(
              children: [
                OutlineButton(
                  onPressed: () {
                    store.dispatch(TestModule.IncrementAction(payload: 10));
                  },
                  child: Text("点我"),
                ),
                new Text(
                  store.state.test.count.toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  backAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            store.dispatch(TabModule.IncrementAction(selectedIndex: 4));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: new ClipOval(
              child: Image.asset(
                'assets/images/head.jpg',
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
