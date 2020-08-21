import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String category = "/category";
  static String cart = "/cart";
  static String my = "/my";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('page not fount');
        return null;
      }
    );

    router.define(root, handler: homeHandler);
    router.define(home, handler: homeHandler);
    router.define(category, handler: categoryHandler);
    router.define(cart, handler: cartHandler);
    router.define(my, handler: myHandler);
  }
}