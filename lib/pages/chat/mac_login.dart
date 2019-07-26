import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';

class MacLogin extends StatelessWidget {

  const MacLogin({Key key}) : super(key: key);


  _buildMenuIcons() {
    final List<MacLoginMenuItem> menus = [
      MacLoginMenuItem(icon: IconFont.iconmute, title: '手机静音'),
      MacLoginMenuItem(icon: IconFont.iconlock, title: '锁定'),
      MacLoginMenuItem(icon: IconFont.iconfile, title: '传文件'),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: menus.map((MacLoginMenuItem menu) {
          return Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: Icon(menu.icon, size: 20.0, color: AppColors.grey3),
            ),
            Text(menu.title, style: TextStyle(color: AppColors.grey3, fontSize: 12))
          ],);
        }).toList()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.macLoginColor,
        leading: IconButton(
          icon: Icon(IconFont.iconclose, size: 28,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: AppColors.macLoginColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(IconFont.iconpc, size: 120,),
                    Text('Mac微信已登录', style: TextStyle(fontSize: 17.0),),
                    SizedBox(height: 5.0,),
                    Text('手机通知已开启', style: TextStyle(color: AppColors.grey2),),
                    SizedBox(height: 50.0,),
                    _buildMenuIcons()
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 8.0),
                color: AppColors.primayGreen,
                textColor: AppColors.primayGreen,
                borderSide: BorderSide(color: AppColors.primayGreen),
                highlightedBorderColor: AppColors.primayGreen,
                child: Text('退出 Mac 微信', style: TextStyle(
                  fontSize: 16.0
                )),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MacLoginMenuItem {
  String title;
  IconData icon;
  String url;

  MacLoginMenuItem({ this.title, this.icon, this.url});
}