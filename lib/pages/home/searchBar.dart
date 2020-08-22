import 'package:buy_winer_app/common/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key key, this.color}) : super(key: key);

  final Color color;

  @override

  /// 头部搜索框
  Widget build(context) {
    return SizedBox(
      height: ScreenUtil().setHeight(100),
      child: AppBar(
        backgroundColor: color,
        leading: IconButton(
          icon: Icon(Iconfont.saoyisao),
          onPressed: () {},
        ),
        elevation: 0,
        title: Container(
          height: ScreenUtil().setHeight(60),
          width: double.infinity,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: <Widget>[Icon(Icons.search)],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Iconfont.xiaoxi1),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
