import 'package:buy_winer_app/common/constant.dart';
import 'package:flutter/material.dart';
import 'searchBar.dart';
import 'banner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> list = List(100).map((val) {
    return Text("123");
  }).toList();

  final ScrollController scrollController = ScrollController();

  Color color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset <= Constant.bannerWidth) {
        setState(() {
          color = Colors.redAccent;
        });
      } else {
        setState(() {
          color = Colors.transparent;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[body(), SearchBar()],
      )),
    );
  }

  Widget body() {
    List<Widget> list = List(100).map((val) {
      return Text("123");
    }).toList();
    return ListView(
      children: <Widget>[
        BannerWidget(),
      ]..addAll(list),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
