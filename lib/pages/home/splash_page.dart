import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 2500), () {
      // 清除之前的路由
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Image.asset('assets/images/launch.png', fit: BoxFit.cover,),
    );
  }
}