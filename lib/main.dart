import 'package:flutter/material.dart';
import 'package:wechat_flutter/pages/home/splash_page.dart';
import 'constants/app_colors.dart';
import 'routes.dart';

void main() => runApp(Wechat());


class Wechat extends StatelessWidget {
  const Wechat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primaryColor
      ),

      home: SplashPage(), // 引导页面
      // initialRoute: '/', 
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}