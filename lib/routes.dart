import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/pages/chat/chat_detail_page.dart';
import 'package:wechat_flutter/pages/home/detail_page.dart';
import 'package:wechat_flutter/pages/home/home_page.dart';
import 'package:wechat_flutter/pages/search/search_page.dart';

final routes = {
  '/': (context) => HomePage(),
  '/search': (context) => SearchPage(),
  '/detail': (context, {arguments}) => DetailPage(arguments: arguments),
  '/chat/detail': (context, {arguments}) => ChatDetailPage(arguments: arguments)
};

var onGenerateRoute = (RouteSettings settings) {
  final Function pageBuilder = routes[settings.name];

  if (pageBuilder != null) {
    Route route;
  
    if (settings.arguments != null) {
      route = CupertinoPageRoute(
        builder: (context) => pageBuilder(context, arguments: settings.arguments)
      );
    } else {
      route = CupertinoPageRoute(
        builder: (context) => pageBuilder(context)
      );
    }

    return route;
  }
};