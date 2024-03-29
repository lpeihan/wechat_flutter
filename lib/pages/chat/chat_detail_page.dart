import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/chat.dart';
import 'package:wechat_flutter/models/profile.dart';

class ChatBox extends StatelessWidget {
  final Conversation conversation;
  final Map message;

  const ChatBox({Key key, this.conversation, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _sendTime = message['updateAt'].length > 0
        ? Container(
            height: 50.0,
            alignment: Alignment.center,
            child: Text(
              message['updateAt'],
              style: TextStyle(color: AppColors.grey2, fontSize: 13.0),
            ),
          )
        : Container();

    return Column(children: <Widget>[
      _sendTime,
      Container(
          margin: EdgeInsets.only(bottom: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WeImage(
                image: conversation.avatar,
                width: 40.0,
                height: 40.0,
                onPressed: () {
                  print(message['id']);
                  Navigator.of(context).pushNamed('/contact/detail', arguments: {
                    'id': message['id'],
                  });
                },
              ),
              SizedBox(
                width: 14.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(right: 50.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            message['content'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Positioned(
                          left: -10.0,
                          top: 11.0,
                          child: Icon(
                            IconFont.iconleft_s,
                            size: 16.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ))
    ]);
  }
}

class SelfChatBox extends StatelessWidget {
  final Conversation conversation;
  final Map message;

  const SelfChatBox({Key key, this.conversation, this.message})
      : super(key: key);


  Widget _image() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Image.file(message['image'], width: 150.0,),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _sendTime = message['updateAt'].length > 0
        ? Container(
            height: 50.0,
            alignment: Alignment.center,
            child: Text(
              message['updateAt'],
              style: TextStyle(color: Color(0xff999999), fontSize: 13.0),
            ),
          )
        : Container();

    Widget _content = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(left: 50.0),
                decoration: BoxDecoration(
                    color: Color(0xff9eec77),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  message['content'],
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Positioned(
                right: -10.0,
                top: 11.0,
                child: Icon(
                  IconFont.iconright_s,
                  size: 16.0,
                  color: Color(0xff9eec77),
                ),
              )
            ],
          )
        ],
      ),
    );

    return Column(children: <Widget>[
      _sendTime,
      Container(
          margin: EdgeInsets.only(bottom: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              message['content'].length == 0 ? _image() : _content,
              SizedBox(
                width: 14.0,
              ),
              WeImage(
                image: userInfo.avatar,
                width: 40.0,
                height: 40.0,
              ),
            ],
          ))
    ]);
  }
}

class ChatDetailPage extends StatefulWidget {
  final Map arguments;

  ChatDetailPage({Key key, this.arguments}) : super(key: key);

  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage>
    with TickerProviderStateMixin {
  String currentText = '';
  TextEditingController inputController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  FocusNode focusNode = FocusNode();
  bool hasFocus = false;
  AnimationController sendButtonController;
  Animation sendButtonAnimation;
  CurvedAnimation curve;
  Conversation conversation;

  _hideKeyBoard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void initState() {
    super.initState();

    sendButtonController =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);

    curve = CurvedAnimation(parent: sendButtonController, curve: Curves.linear);

    sendButtonAnimation = Tween(begin: 0.8, end: 1.0).animate(curve);

    sendButtonController.addListener(() {
      print('${sendButtonController.value}');
      setState(() {});
    });

    sendButtonController.addStatusListener((AnimationStatus status) {
      print(status);
    });

    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });

      if (focusNode.hasFocus) {
        Timer(Duration(milliseconds: 150), () {
          scrollToBottom(offset: 55.0);
        });
      }
    });
  }

  _openImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        conversation.messages.add({
          'image': image,
          'updateAt': '',
          'content': '',
          'avatar': '',
          'self': true
        });
      });
    }
  }

  scrollToBottom({offset = 0, duration = 150}) {
    double diff = _scrollController.position.maxScrollExtent - offset;

    diff = diff > 0 ? diff : 0;

    _scrollController.animateTo(diff,
        curve: Curves.easeOut, duration: Duration(milliseconds: duration));
  }

  @override
  Widget build(BuildContext context) {
    conversation = conversations[widget.arguments['index']];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          conversation.title,
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
      body: new Column(children: <Widget>[
        Flexible(
            child: GestureDetector(
                onTap: () {
                  _hideKeyBoard();
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: AppColors.borderColor, width: 0.5)),
                      color: AppColors.primaryColor,
                    ),
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        // 弹起键盘底部的输入框会挡住聊天内容
                        if (index == conversation.messages.length) {
                          return Container(
                            height: hasFocus ? 55.0 : 0.0,
                          );
                        }
                        Map message = conversation.messages[index];

                        return message['self']
                            ? SelfChatBox(
                                conversation: conversation, message: message)
                            : ChatBox(
                                conversation: conversation, message: message);
                      },
                      itemCount: conversation.messages.length + 1,
                      controller: _scrollController,
                    )))),
        Container(
          height: 55.0,
          decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
              border: Border(
                  top: BorderSide(color: AppColors.borderColor, width: 0.5))),
          child: Row(
            children: <Widget>[
              IconButton(
                iconSize: 28.0,
                icon: Icon(IconFont.iconyuyin3),
                onPressed: () {},
              ),
              Expanded(
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      currentText = val;
                    });

                    if (val.length > 0) {
                      sendButtonController.forward();
                    } else {
                      sendButtonController.reverse();
                    }
                  },
                  controller: inputController,
                  cursorColor: AppColors.primayGreen,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9.0),
                    hintStyle: TextStyle(fontSize: 17.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: TextStyle(color: AppColors.grey1, fontSize: 17.0),
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 5.0),
                  child: Icon(
                    IconFont.iconbiaoqing,
                    size: 26.0,
                  ),
                ),
              ),
              currentText.length > 0
                  ? Transform.scale(
                      scale: sendButtonAnimation.value,
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 78.0,
                        height: 32.0,
                        padding: EdgeInsets.only(left: 5.0, right: 10.0),
                        child: FlatButton(
                          child: Text(
                            '发送',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          color: AppColors.primayGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0)),
                          onPressed: () {
                            setState(() {
                              conversation.messages.add({
                                'content': currentText,
                                'updateAt': '',
                                'avatar': '',
                                'self': true
                              });
                              currentText = '';
                              inputController.text = '';
                            });

                            scrollToBottom();
                          },
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        _openImage();
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(
                          IconFont.iconadd1,
                          size: 26.0,
                        ),
                      ),
                    ),
            ],
          ),
        )
      ]),
    );
  }
}
