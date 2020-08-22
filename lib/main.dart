import 'package:buy_winer_app/common/constant.dart';
import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
// import 'package:buy_winer_app/router/application.dart';
// import 'package:buy_winer_app/router/routes.dart';
import 'package:buy_winer_app/pages/index.dart';

void main() {
  // Router router = Router();
  // Routes.configureRoutes(router);
  // Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: '购酒网',
      theme: ThemeData(primaryColor: Constant.primaryColor),
      // onGenerateRoute: Application.router.generator,
      home: Index(),
    );
  }
}
