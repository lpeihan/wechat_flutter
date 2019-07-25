import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';

class MacLogin extends StatelessWidget {
  const MacLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconFont.iconleft, size: 32,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('hello world')
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                color: AppColors.primayGreen,
                textColor: AppColors.primayGreen,
                borderSide: BorderSide(color: AppColors.primayGreen),
                highlightedBorderColor: AppColors.primayGreen,
                child: Text('退出 Mac 微信', style: TextStyle(
                  fontSize: 16.0
                )),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}