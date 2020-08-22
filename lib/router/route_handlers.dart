import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:buy_winer_app/pages/home/Home.dart';
import 'package:buy_winer_app/pages/category/category.dart';
import 'package:buy_winer_app/pages/cart/cart.dart';
import 'package:buy_winer_app/pages/my/my.dart';

Handler homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  },
);

Handler categoryHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CategoryPage();
  },
);

Handler cartHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CartPage();
  },
);

Handler myHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MyPage();
  },
);
