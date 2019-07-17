import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/conversation.dart';

class WechatPage extends StatelessWidget {
  const WechatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (BuildContext context, int index) {
        Conversation conversation = conversations[index];

        return Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(AppColors.borderColor), width: 0.5)
            )
          ),
          child: Row(
            children: <Widget>[
              conversation.isAvatarLocal ? Image.asset(conversation.avatar, width: 54.0) :
          Image.network(conversation.avatar, width: 54.0),
              SizedBox(width: 12.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(conversation.title, style: TextStyle(fontSize: 17.0, color: Color(conversation.titleColor))),
                    SizedBox(height: 6.0),
                    Text(conversation.desc, style: TextStyle(color: Color(AppColors.textGreyColor)), maxLines: 1, overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Text(conversation.updateAt, style: TextStyle(color: Color(AppColors.textGreyColor),fontSize: 13.0)),
                  SizedBox(height: 8.0),
                  Icon(IconFont.iconmute, color: conversation.isMute ? Color(AppColors.textGreyColor) : Colors.transparent, size: 16.0)
                ],
              )
            ],
          ),
        );
      },
    );
  }
}