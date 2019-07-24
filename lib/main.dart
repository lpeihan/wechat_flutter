import 'package:flutter/material.dart';
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

      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}