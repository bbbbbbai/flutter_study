import 'package:flutter/material.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/search.dart';

import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试001"),
      ),
      body: _getbodyPage(selectedIndex),
      bottomNavigationBar: TitledBottomNavigationBar(
        currentIndex: selectedIndex,
        reverse: false,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          TitledNavigationBarItem(title: Text('录件'), icon: Icons.home),
          TitledNavigationBarItem(title: Text('查件'), icon: Icons.search),
        ],
      ),
    );
  }

  _getbodyPage(selectedIndex) {
    var page;
    switch (selectedIndex) {
      case 0:
        page = Home();
        break;
      case 1:
        page = Search();
        break;
      default:
        page = Container();
    }
    return page;
  }
}
