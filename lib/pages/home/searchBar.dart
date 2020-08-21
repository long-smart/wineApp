import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key key, this.color}) : super(key: key);

  Color color;

  @override

  /// 头部搜索框
  Widget build(context) {
    return SizedBox(
      height: 50,
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.perm_scan_wifi),
        elevation: 0,
        title: Container(
          height: 30,
          width: double.infinity,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: <Widget>[Icon(Icons.search)],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
