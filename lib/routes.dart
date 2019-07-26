import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/pages/chat/chat_detail_page.dart';
import 'package:wechat_flutter/pages/contact/contact_detail_page.dart';
import 'package:wechat_flutter/pages/home/detail_page.dart';
import 'package:wechat_flutter/pages/home/home_page.dart';
import 'package:wechat_flutter/pages/search/search_page.dart';

final routes = {
  '/': (context) => HomePage(),
  '/search': (context) => SearchPage(),
  '/detail': (context, {arguments}) => DetailPage(arguments: arguments),
  '/chat/detail': (context, {arguments}) => ChatDetailPage(arguments: arguments),
  '/contact/detail': (context, {arguments}) => ContactDetailPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  final Function pageBuilder = routes[settings.name];

  if (pageBuilder != null) {
    Route route;
  
    if (settings.arguments != null) {
      // CupertinoPageRoute 是 ios 从右到左的过渡效果
      // MaterialPageRoute 在安卓是从下往上
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