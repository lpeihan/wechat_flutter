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
      color: Color(AppColors.primaryColor),
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 12.0),
            padding: EdgeInsets.only(left: 20, right: 12.0),
            height: 90.0,
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
                              child: Text('微信号: ${userInfo.account}', style: TextStyle(color: Color(AppColors.textGreyColor)),),
                            )
                          ),
                          Icon(IconFont.iconscancode, size: 18.0, color: Color(AppColors.textGreyColor),),
                          SizedBox(width: 5.0,),
                          Icon(IconFont.iconright, color: Color(AppColors.textGreyColor))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          WeTile(iconPath: 'assets/images/ic_wallet.png', title: '支付', marginBottom: true,),

          WeTile(iconPath: 'assets/images/ic_collections.png', title: '收藏', borderBottom: true,),
          WeTile(iconPath: 'assets/images/ic_album.png', title: '相册', borderBottom: true,),
          WeTile(iconPath: 'assets/images/ic_cards_wallet.png', title: '卡包', borderBottom: true,),
          WeTile(iconPath: 'assets/images/ic_emotions.png', title: '表情', marginBottom: true),

          WeTile(iconPath: 'assets/images/ic_settings.png', title: '设置', marginBottom: true,),



        ],
      ),
    );
  }
}