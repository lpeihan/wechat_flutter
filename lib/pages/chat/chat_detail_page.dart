import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/chat.dart';

class ChatBox extends StatelessWidget {
  final Conversation conversation;
  final Map message;

  const ChatBox({Key key,  this.conversation, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _avatar = WeImage(image: conversation.avatar, width: 40.0, height: 40.0,);

    Widget _content = Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 1.0,),
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(right: 52.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: Text(message['content'],
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Positioned(
              left: -10.0,
              top: 12.0,
              child: Icon(IconFont.iconleft_s, size: 16.0, color: Colors.white,),
            )
          ],
        )
      ],
    ),
  );

  Widget _sendTime =  message['updateAt'].length > 0 ? Container(
    height: 50.0,
    alignment: Alignment.center,
    child: Text(message['updateAt'], style: TextStyle(color: Color(0xff999999), fontSize: 13.0),),
  ) : Container();
  
  return Column(
    children: <Widget>[
      _sendTime,
      Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _avatar,
            SizedBox(width: 14.0,),
            _content
          ],
        )
      )
    ],
  );
  }
} 

class ChatDetailPage extends StatefulWidget {
  final Map arguments;

  ChatDetailPage({Key key, this.arguments}) : super(key: key);

  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {

  _hideKeyBoard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    Conversation conversation = conversations[widget.arguments['index']];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(conversation.title, style: TextStyle(fontSize: 18.0),),
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
      body: new Column(
        children: <Widget>[
          Flexible(
            child: GestureDetector(
              onTap: () { _hideKeyBoard(); },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Color(AppColors.borderColor), width: 0.5)),
                  color: Color(AppColors.primaryColor),
                ),
                child: ListView(
                  children: conversation.messages.map((message) {
                    return ChatBox(conversation: conversation, message: message);
                  }).toList()
                ),
              )
            )
          ),
          Container(
            height: 55.0,
            decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
              border: Border(top: BorderSide(color: Color(AppColors.borderColor), width: 0.5))
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  iconSize: 28.0,
                  icon: Icon(IconFont.iconyuyin3),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    cursorColor: Color(AppColors.wechatColor),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(9.0),
                      hintStyle: TextStyle(fontSize: 17.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: TextStyle(color: Color(AppColors.textColor), fontSize: 17.0),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 5.0),
                    child: Icon(IconFont.iconbiaoqing, size: 26.0,),
                  ),
                ), 
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(left: 5.0, right: 10.0),
                    child: Icon(IconFont.iconadd1, size: 26.0,),
                  ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}