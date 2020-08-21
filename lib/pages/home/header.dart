import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:buy_winer_app/common/constant.dart';

/// 头部搜索 和 banner
class HeaderWidget extends StatefulWidget {
  HeaderWidget({Key key, this.color}) : super(key: key);
  Color color;
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> with SingleTickerProviderStateMixin {
  List<Widget> list = List(100).map((val) {
    return Text("123");
  }).toList();

  final List<String> imgUrls = [
    'http://img0.gjw.com/famous/2020/0815/5f0b99fd37c74e6c883d429642139a53.jpg',
    'http://img0.gjw.com/famous/2020/0722/90efea94b24346919a8665c3931046c2.jpg',
    'http://img0.gjw.com/famous/2020/0803/fc087c8b34f943e3aaa9379e4a3e7a71.jpg',
    'http://img0.gjw.com/famous/2020/0611/fb838df5fe7841509349e65a4bd9d8bb.jpg',
    'http://img0.gjw.com/famous/2019/0930/5e02e64bb8ef420fbf3cd806ab0fc3b8.jpg'
  ];

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: Constant.bannerWidth,
  //     child: Stack(
  //       children: <Widget>[
  //         banner(),
  //         search(),
  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[banner()]..addAll(list),
    );
  }

  /// 头部搜索框
  Widget search() {
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

  // banner
  Widget banner() {
    return SizedBox(
      height: Constant.bannerWidth,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pinkAccent),
        child: Swiper(
          autoplay: false,
          itemCount: imgUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              '${imgUrls[index]}',
              fit: BoxFit.fill,
            );
          },
          pagination: SwiperPagination(),
        ),
      ),
    );
  }
}
