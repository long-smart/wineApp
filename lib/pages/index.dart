import 'package:flutter/material.dart';
import 'package:buy_winer_app/pages/home/home.dart';
import 'package:buy_winer_app/pages/category/category.dart';
import 'package:buy_winer_app/pages/cart/cart.dart';
import 'package:buy_winer_app/pages/my/my.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  int index = 0;
  final List<Widget> pages = [HomePage(), CategoryPage(), CartPage(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), title: Text('购物车')),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('我的'))
        ],
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      body: pages[index],
    );
  }
}
