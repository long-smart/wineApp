import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatelessWidget {
  final List<String> btnDatas = [
    'http://img0.gjw.com/famous/2018/0713/34c90a46f767478897208adca7681ae4.jpg',
    'http://img0.gjw.com/famous/2018/0713/3f257a2d80cb49e5a1e65340201329f0.jpg',
    'http://img0.gjw.com/famous/2018/0713/a8da83fed83c44f2a7a9f64862cd6489.jpg',
    'http://img0.gjw.com/famous/2018/0713/229cbdd4a909417ba6218c7e21b48131.jpg',
    'http://img0.gjw.com/famous/2018/0801/8bf04e420aa64ccfbb9ae530f82ddd7d.jpg',
    'http://img0.gjw.com/famous/2020/0529/d4431e8d57624454939fc6d3d565cf8c.jpg',
    'http://img0.gjw.com/famous/2018/0713/07223d7582de4438875efedac3d9cd90.jpg',
    'http://img0.gjw.com/famous/2018/0713/c7ee25ce88144ebe9f1c743c64df2000.jpg',
    'http://img0.gjw.com/famous/2018/0801/8fccd4a2c00947869641bd32c0a4c42f.jpg',
    'http://img0.gjw.com/famous/2018/0801/a4b34eda8bc24782994a4d86cd2528ce.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: btnDatas
          .map((e) => InkWell(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Image.network('$e'),
                ),
                onTap: () {
                  
                },
              ))
          .toList(),
    );
  }
}
