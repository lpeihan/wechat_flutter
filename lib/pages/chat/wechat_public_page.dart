import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/chat.dart';

class WechatPublicItem extends StatelessWidget {
  const WechatPublicItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class WechatPublicPage extends StatelessWidget {
  final Map arguments;
  const WechatPublicPage({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}