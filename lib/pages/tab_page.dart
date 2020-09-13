import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/search.dart';
import 'package:my_app/store/index.dart';
import 'package:my_app/utils/utils.dart';
import 'package:my_app/widget/connectWiget.dart';
import '../module/tab.dart' as TabModule;
import '../module/loginState.dart' as LoginStateModule;

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedIndex = 0;
  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> pages = List();
  @override
  void initState() {
    super.initState();
    store.dispatch(LoginStateModule.LoginStateActionAction(
        actions: LoginStateModule.Actions.logout));
    pages
      ..add(Home())
      ..add(Search())
      ..add(Container())
      ..add(Container())
      ..add(Container());
  }

  DateTime lastPopTime;
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      child: WillPopScope(
        // ignore: missing_return
        onWillPop: () async {
          if (lastPopTime == null ||
              DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
            lastPopTime = DateTime.now();
            Utils.myToast(context, "再按一次退出");
          } else {
            lastPopTime = DateTime.now();
            // 退出app
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
        },
        child: connect((store) {
          return store.state.test.count;
        }, (context, count, store) {
          return Scaffold(
            body: IndexedStack(
              index: store.state.tab.selectedIndex,
              children: pages,
            ),
            appBar: null,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Color(0XFFfb7299),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('首页'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  title: Text('频道'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.all_inclusive),
                  title: Text('动态'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text('会员购'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle),
                  title: Text('我的'),
                ),
              ],
              currentIndex: store.state.tab.selectedIndex,
              onTap: (index) {
                _getbodyPage(index, store);
              },
            ),
          );
        }),
      ),
      store: store,
    );
  }

  _getbodyPage(num, store) {
    store.dispatch(TabModule.IncrementAction(selectedIndex: num));

    var page;
    switch (store.state.tab.selectedIndex) {
      case 0:
        break;
      case 1:
        break;
      default:
    }
    return page;
  }
}
