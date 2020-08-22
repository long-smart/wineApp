import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSliderWidget extends StatefulWidget {
  TextSliderWidget({Key key}) : super(key: key);

  @override
  _TextSliderWidgetState createState() => _TextSliderWidgetState();
}

class _TextSliderWidgetState extends State<TextSliderWidget> {
  int index = 0;
  List<String> texts = ['古井醇香 清仓钜惠', '洛神山庄1845', '花满山 清仓聚会'];

  Timer timer;

  @override
  void initState() {
    super.initState();
    // 2s 执行一次
    timer = Timer.periodic(Duration(seconds: 2), (t) {
      setState(() {
        if (index == texts.length - 1) {
          index = 0;
          return;
        }
        index += 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          text(), // 左边文字图片
          slider(), // 右边滑动文字
        ],
      ),
    );
  }

  Widget text() {
    return Container(
      width: ScreenUtil().setWidth(230),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Image.asset('assets/images/hot.png'),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color(0xffcccccc),
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget slider() {
    return ClipRRect(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return Container(
            padding: EdgeInsets.only(left: 20),
            width: ScreenUtil().setWidth(350),
            child: MySlideTransition(
              child: child,
              direction: AxisDirection.up,
              positon: animation,
            ),
          );
        },
        child: Text(
          '${texts[index]}',
          key: ValueKey(texts[index]),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

/// 上下滑动切换文字效果封装
// ignore: must_be_immutable
class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<double> positon,
    this.transformHitTests = true,
    this.direction = AxisDirection.up,
    this.child,
  }) : super(key: key, listenable: positon) {
    // 偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  //退场（出）方向
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
