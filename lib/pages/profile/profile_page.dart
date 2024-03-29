import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/components/we_tile.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.only(left: 20, right: 12.0),
            height: 90.0,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/detail', arguments: { 'title': '个人信息' });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  WeImage(image: userInfo.avatar, width: 60.0, height: 60.0,),
                  SizedBox(width: 15.0,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 4.0,),
                        Text(userInfo.name, style: TextStyle(fontSize: 18.0),),
                        SizedBox(height: 8.0,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text('微信号: ${userInfo.account}', style: TextStyle(color: AppColors.grey3),),
                              )
                            ),
                            Icon(IconFont.iconscancode, size: 18.0, color: AppColors.grey3,),
                            SizedBox(width: 5.0,),
                            Icon(IconFont.iconright, color: AppColors.grey3)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          WeTile(
            iconPath: 'assets/images/ic_wallet.png',
            title: '支付',
            onPressed: () {
              Navigator.of(context).pushNamed('/detail', arguments: { 'title': '支付' });
            }
          ),
          SizedBox(height: 10,),

          WeTile(
            iconPath: 'assets/images/ic_collections.png',
            title: '收藏',
            borderBottom: true,
            onPressed: () {
              Navigator.of(context).pushNamed('/detail', arguments: { 'title': '支付' });
            }
          ),
          WeTile(
            iconPath: 'assets/images/ic_album.png',
            title: '相册',
            borderBottom: true,
            onPressed: () {
              Navigator.of(context).pushNamed('/detail', arguments: { 'title': '支付' });
            }
          ),
          WeTile(
            iconPath: 'assets/images/ic_cards_wallet.png',
            title: '卡包',
            borderBottom: true,
            onPressed: () {
              Navigator.of(context).pushNamed('/detail', arguments: { 'title': '支付' });
            }
          ),
          WeTile(
            iconPath: 'assets/images/ic_emotions.png',
            title: '表情',
            onPressed: () {
              Navigator.of(context).pushNamed('/detail', arguments: { 'title': '支付' });
            }
          ),
          SizedBox(height: 10,),

          WeTile(
            iconPath: 'assets/images/ic_settings.png',
            title: '设置',
            onPressed: () {
              Navigator.of(context).pushNamed('/detail', arguments: { 'title': '支付' });
            }
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}