import 'package:flutter/material.dart';
import 'package:my_app/widget/connectWiget.dart';
import '../module/test.dart' as TestModule;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return connect((store) {
      return store.state.test.count;
    }, (context, count, store) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString()),
            OutlineButton(
              onPressed: () {
                store.dispatch(TestModule.TestAction(count: 10));
              },
              child: Text("点我"),
            ),
          ],
        ),
      );
    });
  }
}
