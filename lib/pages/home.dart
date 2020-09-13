import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:my_app/common/common_data.dart';
import 'package:my_app/store/index.dart';
import 'package:my_app/widget/connectWiget.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    getInfo();
  }

  getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("COUNT ====== ${prefs.getInt(CommonData.COUNT)}");
  }

  bool _isLoading = false;
  void action(Store<String> store) async {
    final String searchResults = await Future.delayed(
      Duration(seconds: 1),
      () => "Search Results",
    );

    store.dispatch(searchResults);
  }

  @override
  Widget build(BuildContext context) {
    return connect(
      (store) {
        return store;
      },
      (context, count, store) {
        // store.dispatch(LoginStateModule.LoginStateActionAction(
        //     actions: LoginStateModule.Actions.login));
        return LoadingOverlay(
          isLoading: _isLoading,
          child: Scaffold(
            appBar: backAppbar(context),
            body: Column(
              children: [
                OutlineButton(
                  onPressed: () {
                    store.dispatch(TestModule.TestAction(count: 10));
                  },
                  child: Text("点我"),
                ),
                OutlineButton(
                  onPressed: () {
                    store.dispatch(TestModule.testActionAsync(store: store));
                  },
                  child: Text("点我async"),
                ),
                new Text(
                  store.state.test.count.toString(),
                ),
                new Text(store.state.loginState.authorizationToken)
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
