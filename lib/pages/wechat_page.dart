import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/models/conversation.dart';

class WechatPage extends StatelessWidget {
  var tapPos;

  WechatPage({Key key}) : super(key: key);

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
      ])
      .then<String>((String selected) {
        switch (selected) {
          default:
            print('当前选中的是：$selected');
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (BuildContext context, int index) {
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
                        borderRadius: BorderRadius.circular(10.0),
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
                        borderRadius: BorderRadius.circular(18.0),
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
            print(conversation.title);
          },
          onTapDown: (TapDownDetails details) {
            tapPos = details.globalPosition;
          },
          onLongPress: () {
            _showMenu(context, tapPos);
          },
          child: Container(
            height: 72.0,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                                color: Color(AppColors.borderColor),
                                width: 0.5))),
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
                                style: TextStyle(
                                    color: Color(AppColors.textGreyColor)),
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
                                    color: Color(AppColors.textGreyColor),
                                    fontSize: 12.0)),
                            SizedBox(height: 12.0),
                            Icon(IconFont.iconmute,
                                color: conversation.isMute
                                    ? Color(AppColors.textGreyColor)
                                    : Colors.transparent,
                                size: 16.0)
                          ],
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
