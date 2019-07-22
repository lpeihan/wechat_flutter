import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';

class ChatDetailPage extends StatefulWidget {
  final Map arguments;

  ChatDetailPage({Key key, this.arguments}) : super(key: key);

  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.arguments['title']),
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
        color: Color(AppColors.primaryColor),
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(AppColors.primaryColor),
          border: Border(top: BorderSide(width: 0.5, color: Color(AppColors.borderColor)))
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(IconFont.iconyuyin1, color: Color(AppColors.textColor), size: 30,),
              onPressed: () {},
            ),
            SizedBox(width: 8.0,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red
                ),
                child: TextField(
                  cursorColor: Color(AppColors.wechatColor),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9.0),
                    hintStyle: TextStyle(fontSize: 17.0),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: TextStyle(color: Color(AppColors.textColor), fontSize: 17.0),
                ),
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(IconFont.iconbiaoqing, color: Color(AppColors.textColor), size: 30),
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(IconFont.iconadd1, color: Color(AppColors.textColor), size: 26,),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
