import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/chat.dart';

class WechatSportItem extends StatelessWidget {
  final Map item;
  WechatSportItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 60.0,
          padding: EdgeInsets.only(top: 15.0),
          alignment: Alignment.center,
          child: Text(item['time'], style: TextStyle(fontSize: 13.0, color: AppColors.grey3),),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: AppColors.borderColor),
            color: Colors.white,
          ),
          child: FlatButton(
            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
            onPressed: () {},
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(item['rank'], style: TextStyle(color: AppColors.primayGreen, fontSize: 34.0, fontWeight: FontWeight.w400)),
                        Text('名次', style: TextStyle(color: AppColors.primayGreen, fontSize: 15.0))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(item['walkCount'], style: TextStyle(color: AppColors.primayGreen, fontSize: 34.0, fontWeight: FontWeight.w400)),
                        Text('步数', style: TextStyle(color: AppColors.primayGreen, fontSize: 15.0))
                      ],
                    )
                  ],
                ),
                SizedBox(height:40.0,),
                Container(
                  height: 72,
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: AppColors.borderColor, width: 0.5))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      WeImage(
                        width: 48.0,
                        height: 48.0,
                        radius: 24.0,
                        image: item['avatar']),
                      SizedBox(width: 15.0,),
                      Expanded(
                        child: Text('夺得${item["date"]}排行榜冠军', style: TextStyle(fontSize: 16.0, color: AppColors.primayGreen),),
                      ),
                      Icon(IconFont.iconright, color: AppColors.grey3,)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


class WechatSportPage extends StatelessWidget {
  const WechatSportPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = [
      {
        'avatar': 'https://randomuser.me/api/portraits/men/15.jpg',
        'date': '07月24日',
        'time': '07月24日 20:52',
        'walkCount': '6271',
        'rank': '18'
      },
      {
        'avatar': 'https://randomuser.me/api/portraits/women/14.jpg',
        'date': '07月28日',
        'time': '07月28日 22:12',
        'walkCount': '11302',
        'rank': '2'
      }
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          conversations[0].title,
          style: TextStyle(fontSize: 18.0),
        ),
        leading: IconButton(
          icon: Icon(
            IconFont.iconleft,
            size: 32.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: AppColors.primaryColor,
        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return WechatSportItem(item: list[index],);
          },
          itemCount: list.length,
        )
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          height: 55.0,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.borderColor, width: 0.5))
          ),
          child: FlatButton(
            color: Color(0xfffafafa),
            onPressed: () {},
            child: Text('步数排行榜', style: TextStyle(fontSize: 15.0)),
          )
        ),
      ),
    );
  }
}