import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget _textItem(name) {
    return Container(
      width: 100.0,
      alignment: Alignment.center,
      child: Text(name, style: TextStyle(color: Color(AppColors.blue), fontSize: 15.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(IconFont.iconleft, size: 32.0),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                cursorColor: Color(AppColors.wechatColor),
                cursorWidth: 1.0,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "搜索",
                  hintStyle: TextStyle(fontSize: 17.0),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Color(AppColors.textColor), fontSize: 17.0),
              ),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: Color(AppColors.primaryColor),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              width: double.infinity,
              child: Text('搜索指定内容', style: TextStyle(color: Color(AppColors.textGreyColor), fontSize: 16.0), ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35.0),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _textItem('朋友圈'),
                  _textItem('文章'),
                  _textItem('公众号'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _textItem('小程序'),
                  _textItem('音乐'),
                  _textItem('表情'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}