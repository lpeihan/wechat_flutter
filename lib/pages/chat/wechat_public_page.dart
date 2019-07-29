import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/chat.dart';

class WechatPublicItem extends StatelessWidget {
  final Map message;
  const WechatPublicItem({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            alignment: Alignment.center,
            child: Text(message['updateAt'], style: TextStyle(fontSize: 13.0, color: AppColors.grey3),),
          ),
          Card(
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 2 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.network(
                        message['picUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(message['content'], style: TextStyle(fontSize: 16.0)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15.0,)
        ],
      ),
    );
  }
}


class WechatPublicPage extends StatelessWidget {
  final Map arguments;
  const WechatPublicPage({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Conversation conversation = conversations[arguments['index']];

    return Scaffold(
        appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          conversations[arguments['index']].title,
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
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return WechatPublicItem(message: conversation.messages[index]);
          },
          itemCount: conversation.messages.length,
        ),
      ),
    );
  }
}