import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_tile.dart';
import 'package:wechat_flutter/constants/app_colors.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                WeTile(
                  iconPath: 'assets/images/ic_social_circle.png',
                  title: '朋友圈',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '朋友圈' });
                  }
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'assets/images/ic_quick_scan.png',
                  title: '扫一扫',
                  borderBottom: true,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '扫一扫' });
                  }
                ),
                WeTile(
                  iconPath: 'assets/images/ic_shake_phone.png',
                  title: '摇一摇',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '摇一摇' });
                  }
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'assets/images/ic_feeds.png',
                  title: '看一看',
                  borderBottom: true,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '看一看' });
                  }
                ),
                WeTile(
                  iconPath: 'assets/images/ic_quick_search.png',
                  title: '搜一搜',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '搜一搜' });
                  }
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'assets/images/ic_people_nearby.png',
                  title: '附近的人',
                  borderBottom: true,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '附近的人' });
                  }
                ),
                WeTile(
                  iconPath: 'assets/images/ic_bottle_msg.png',
                  title: '漂流瓶',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '漂流瓶' });
                  }
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'assets/images/ic_shopping.png',
                  title: '购物',
                  borderBottom: true,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '购物' });
                  }
                ),
                WeTile(
                  iconPath: 'assets/images/ic_game_entry.png',
                  title: '游戏',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '游戏' });
                  }
                ),
                SizedBox(height: 10,),

                WeTile(
                  iconPath: 'assets/images/ic_mini_program.png',
                  title: '小程序',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/detail', arguments: { 'title': '小程序' });
                  }
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