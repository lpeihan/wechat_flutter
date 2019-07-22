import 'package:flutter/material.dart';
import 'package:wechat_flutter/pages/home/home_page.dart';
import 'package:wechat_flutter/pages/search/search_page.dart';

final routes = {
  '/': (context) => HomePage(),
  '/search': (context) => SearchPage()
};

var onGenerateRoute = (RouteSettings settings) {
  final Function pageBuilder = routes[settings.name];

  if (pageBuilder != null) {
    Route route;
  
    if (settings.arguments != null) {
      route = MaterialPageRoute(
        builder: (context) => pageBuilder(context, arguments: settings.arguments)
      );
    } else {
      route = MaterialPageRoute(
        builder: (context) => pageBuilder(context)
      );
    }

    return route;
  }
};