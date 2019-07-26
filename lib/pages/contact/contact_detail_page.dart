import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/contact.dart' show contacts, Contact;

class ContactDetailField extends StatelessWidget {
  final String title;

  ContactDetailField({this.title});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      padding: EdgeInsets.all(0),
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: AppColors.borderColor))
        ),
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 16.0)),
            Icon(IconFont.iconright, color: AppColors.grey3),
          ],
        ),
      ),
    );
  }
}

class ContactDetailPage extends StatefulWidget {
  final Map arguments;
  ContactDetailPage({Key key, this.arguments}) : super(key: key);

  _ContactDetailPageState createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    Contact contact = contacts[widget.arguments['index']];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            IconFont.iconleft,
            size: 32.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(IconFont.iconmore),
            iconSize: 28.0,
            onPressed: () {},
          )
        ],
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 0.5, color: AppColors.borderColor))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                WeImage(
                  width: 60,
                  height: 60,
                  image: contact.avatar,
                ),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(contact.name, style: TextStyle(fontSize: 19.0),),
                        SizedBox(width: 5.0,),
                        contact.sex == 0 ? Icon(IconFont.iconwoman, color: Colors.red,) : Icon(IconFont.iconman, color: Colors.blue, size: 20.0,)
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: <Widget>[
                        Text('微信号：', style: TextStyle(color: AppColors.grey2, fontSize: 15.0),),
                        Text('hello_' + contact.name.toLowerCase(), style: TextStyle(color: AppColors.grey2, fontSize: 15.0))
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: <Widget>[
                        Text('地区：', style: TextStyle(color: AppColors.grey2, fontSize: 15.0)),
                        Text(contact.area, style: TextStyle(color: AppColors.grey2, fontSize: 15.0))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          ContactDetailField(title: '设置备注和名称',),
          SizedBox(height: 12.0,),
          ContactDetailField(title: '朋友圈',),
          ContactDetailField(title: '更多信息',),
          SizedBox(height: 12.0,),
          FlatButton(
            color: Colors.white,
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5, color: AppColors.borderColor))
              ),
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(IconFont.iconmessage, size: 20.0, color: AppColors.textBlue,),
                  SizedBox(width: 5.0,),
                  Text('发消息', style: TextStyle(color: AppColors.textBlue, fontSize: 17.0),)
                ],
              ),
            )
          ),
          FlatButton(
            color: Colors.white,
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5, color: AppColors.borderColor))
              ),
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(IconFont.iconvideo, size: 26.0, color: AppColors.textBlue,),
                  SizedBox(width: 5.0,),
                  Text('音视频通话', style: TextStyle(color: AppColors.textBlue, fontSize: 17.0))
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}