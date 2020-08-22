import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 掌上秒拍 (限时特价)
class TimedWidget extends StatefulWidget {
  TimedWidget({Key key}) : super(key: key);

  @override
  _TimedWidgetState createState() => _TimedWidgetState();
}

class _TimedWidgetState extends State<TimedWidget> {
  DateTime now = DateTime.now(); // 开始时间
  DateTime end; // 结束时间
  Timer timer;
  int hours = 0, min = 0, seconds = 0;
  @override
  void initState() {
    super.initState();
    end = now.add(Duration(days: 3));

    // 每秒计算一次剩余的时间
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      now = DateTime.now();

      var diff = end.millisecondsSinceEpoch - now.millisecondsSinceEpoch;
      setState(() {
        const hour1 = 1000 * 60 * 60;
        const min1 = 1000 * 60;
        const sec = 1000;
        hours = (diff / hour1).floor();
        var mill = diff - hours * hour1;
        min = (mill / min1).floor();
        mill = mill - min * min1;
        seconds = (mill / sec).floor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: content(),
    );
  }

  Widget content() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            '掌上秒拍',
            style: TextStyle(fontSize: ScreenUtil().setSp(28)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '距结束',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(22), color: Color(0xff6B6B6B)),
          ),
        ),
        rectText('$hours'),
        colon(),
        rectText('$min'),
        colon(),
        rectText('$seconds'),
      ],
    );
  }

  Widget rectText(String str) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(40),
      height: ScreenUtil().setHeight(40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xff999999)),
      child: Text(str, style: TextStyle(color: Colors.white)),
    );
  }

  Widget colon() {
    return Text('：', style: TextStyle(fontSize: ScreenUtil().setSp(22)));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
