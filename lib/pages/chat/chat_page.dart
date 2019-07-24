import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/chat.dart';
import 'package:wechat_flutter/pages/chat/chat_detail_page.dart';

class ChatPage extends StatelessWidget {
  var tapPos;

  ChatPage({Key key}) : super(key: key);

  _showMenu(BuildContext context, Offset tapPos) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromLTRB(tapPos.dx, tapPos.dy,
        overlay.size.width - tapPos.dx, overlay.size.height - tapPos.dy);

    showMenu<String>(
        context: context,
        position: position,
        items: <PopupMenuItem<String>>[
          PopupMenuItem(
            child: Text('标为未读'),
            value: 'MENU_MARK_AS_UNREAD',
          ),
          PopupMenuItem(
            child: Text('置顶聊天'),
            value: 'MENU_PIN_TO_TOP',
          ),
          PopupMenuItem(
            child: Text('删除该聊天'),
            value: 'MENU_DELETE_CONVERSATION',
          ),
        ]).then<String>((String selected) {
      switch (selected) {
        case 'MENU_MARK_AS_UNREAD':
          Navigator.of(context)
              .pushNamed('/detail', arguments: {'title': '标为未读'});
          break;
        case 'MENU_PIN_TO_TOP':
          Navigator.of(context)
              .pushNamed('/detail', arguments: {'title': '置顶聊天'});
          break;
        case 'MENU_DELETE_CONVERSATION':
          Navigator.of(context)
              .pushNamed('/detail', arguments: {'title': '删除该聊天'});
          break;
        default:
          print('当前选中的是：$selected');
      }
    });
  }

  Widget _buildPcLogin(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      color: Color(0xfff3f3f3),
      onPressed: () {
        Navigator.of(context)
            .pushNamed('/detail', arguments: {'title': 'Mac 已登录'});
      },
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.borderColor, width: 0.5),
            bottom: BorderSide(color: AppColors.borderColor, width: 0.5),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 48.0,
              child: Icon(
                IconFont.iconmac,
                color: Color(0xff888888),
                size: 22.0,
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Text('Mac 微信已登录', style: TextStyle(color: Color(0xff888888)))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversations.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildPcLogin(context);
        }

        index -= 1;

        Conversation conversation = conversations[index];

        Widget _avatar = WeImage(
          image: conversation.avatar,
          width: 48.0,
          height: 48.0,
        );

        Widget _avatarContainer;
        if (conversation.unreadMsgCount > 0) {
          if (conversation.displayDot) {
            _avatarContainer = Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                _avatar,
                Positioned(
                  right: -3.0,
                  top: -3.0,
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.red),
                  ),
                )
              ],
            );
          } else {
            _avatarContainer = Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                _avatar,
                Positioned(
                  right: -6.0,
                  top: -6.0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 18.0,
                    height: 18.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: Colors.red),
                    child: Text(conversation.unreadMsgCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12.0)),
                  ),
                )
              ],
            );
          }
        } else {
          _avatarContainer = _avatar;
        }

        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/chat/detail',
                arguments: {'title': conversation.title, 'index': index});
          },
          onTapDown: (TapDownDetails details) {
            tapPos = details.globalPosition;
          },
          onLongPress: () {
            _showMenu(context, tapPos);
          },
          child: Container(
            height: 72.0,
            padding: EdgeInsets.only(left: 12.0),
            child: Row(
              children: <Widget>[
                _avatarContainer,
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.borderColor, width: 0.5))),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(conversation.title,
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Color(conversation.titleColor))),
                              SizedBox(height: 6.0),
                              Text(
                                conversation.desc,
                                style: TextStyle(color: AppColors.grey3),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(conversation.updateAt,
                                style: TextStyle(
                                    color: AppColors.grey3, fontSize: 12.0)),
                            SizedBox(height: 12.0),
                            Icon(IconFont.iconmute,
                                color: conversation.isMute
                                    ? AppColors.grey3
                                    : Colors.transparent,
                                size: 16.0)
                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
