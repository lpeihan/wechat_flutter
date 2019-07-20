import 'package:flutter_web/material.dart';
import 'package:wechat_flutter/components/we_tile.dart';
import 'package:wechat_flutter/constants/app_colors.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Color(AppColors.primaryColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                WeTile(
                  iconPath: 'images/ic_social_circle.png',
                  title: '朋友圈',
                  onPressed: () {}
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'images/ic_quick_scan.png',
                  title: '扫一扫',
                  borderBottom: true,
                  onPressed: () {}
                ),
                WeTile(
                  iconPath: 'images/ic_shake_phone.png',
                  title: '摇一摇',
                  onPressed: () {}
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'images/ic_feeds.png',
                  title: '看一看',
                  borderBottom: true,
                  onPressed: () {}
                ),
                WeTile(
                  iconPath: 'images/ic_quick_search.png',
                  title: '搜一搜',
                  onPressed: () {}
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'images/ic_people_nearby.png',
                  title: '附近的人',
                  borderBottom: true,
                  onPressed: () {}
                ),
                WeTile(
                  iconPath: 'images/ic_bottle_msg.png',
                  title: '漂流瓶',
                  onPressed: () {}
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'images/ic_shopping.png',
                  title: '购物',
                  borderBottom: true,
                  onPressed: () {}
                ),
                WeTile(
                  iconPath: 'images/ic_game_entry.png',
                  title: '游戏',
                  onPressed: () {}
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'images/ic_mini_program.png',
                  title: '小程序',
                  onPressed: () {}
                ),
                SizedBox(height: 10,),
              ],
            )
          ]
        ),
      )
    );
  }
}