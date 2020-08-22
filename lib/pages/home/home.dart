import 'package:buy_winer_app/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'SearchBar.dart';
import 'Banner.dart';
import 'Category.dart';
import 'TextSlider.dart';
import 'Timed.dart';

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
    // 监听页面滚动, 让头部 appBar变化颜色
    scrollController.addListener(() {
      if (scrollController.offset >= ScreenUtil().setHeight(Constant.bannerWidth)) {
        setState(() {
          color = Constant.primaryColor;
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
          // 将页面主体内容放在 搜索框上面, 设置搜索框背景透明
          children: <Widget>[
            body(),
            SearchBar(color: color),
          ],
        ),
      ),
    );
  }

  Widget body() {
    List<Widget> list = List(100).map((val) {
      return Text("123");
    }).toList();

    return ListView(
      controller: scrollController,
      children: <Widget>[
        BannerWidget(), // banner轮播图
        TextSliderWidget(), // 头条
        HomeCategoryWidget(), // 分类
        TimedWidget(), // 掌上秒拍
      ]..addAll(list),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
