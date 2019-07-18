import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/models/contacts.dart' show contacts, Contact, INDEX_LETTERS;

const double TITLE_HEIGHT = 24;
const double ITEM_HEIGHT = 64;
const double BORDER_WIDTH = 0.5;

class ContactItem extends StatelessWidget {
  final bool isGroupTitle;
  final Contact contact;

  const ContactItem({Key key, this.isGroupTitle, @required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildWidget = [];

    if (isGroupTitle) {
      _buildWidget.add(
        Container(
          height: TITLE_HEIGHT,
          padding: EdgeInsets.only(left: 15.0),
          color: Color(AppColors.primaryColor),
          alignment: Alignment.centerLeft,
          child: Text(contact.letter, style: TextStyle(fontSize: 12.0),),
        ),
      );
    }

    _buildWidget.add(
      Container(
        padding: EdgeInsets.only(left: 15.0),
        child: Row(
          children: <Widget>[
            WeImage(
              image: contact.avatar,
              width: 42.0,
              height: 42.0,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                height: ITEM_HEIGHT,
                margin: EdgeInsets.only(left: 15.0),
                child: Text(contact.name),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: BORDER_WIDTH, color: Color(AppColors.borderColor))
                  )
                ),
              ),
            )
          ],
        ),
      )
    );

    return Column(
      children: _buildWidget
    );
  }
}

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> _contacts = [];
  ScrollController _scrollController = ScrollController();
  final Map heightMap = { INDEX_LETTERS[0]: 0.0 };
  double tileHeight = 0;
  String currentLetter = INDEX_LETTERS[0];

  List<Contact> topItems = [
    Contact(
      avatar: 'assets/images/ic_new_friend.png',
      name: '新的朋友',
    ),
    Contact(
      avatar: 'assets/images/ic_group_chat.png',
      name: '群聊',
    ),
    Contact(
      avatar: 'assets/images/ic_tag.png',
      name: '标签',
    ),
    Contact(
      avatar: 'assets/images/ic_public_account.png',
      name: '公众号',
    ),
  ];

  GlobalKey indexBarKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _contacts
      ..addAll(contacts)
      ..addAll(contacts)
      ..addAll(contacts)
      ..sort((a, b) => a.letter.compareTo(b.letter));

    this.initHeight();

    _scrollController.addListener(() {
      double offset = _scrollController.offset;

      List list = heightMap.keys.toList();
      String nearLetter = list[0];
      double nearHeight = offset - heightMap[nearLetter];

      for (int i = 1; i < list.length; i++) {
        double dy = offset - heightMap[list[i]];

        if (dy >= 0 && dy < nearHeight) {
          nearLetter = list[i];
          nearHeight = dy;
        }
      }

      setState(() {
        currentLetter =  nearLetter;
      });
    });

  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  initHeight() {
    double _totalHeight = 4 * ITEM_HEIGHT;
  
    for(int i = 0; i < _contacts.length; i++) {
      bool isGroupTitle = true;
      double height = ITEM_HEIGHT + BORDER_WIDTH;

      if (i >= 1 && _contacts[i].letter.compareTo(_contacts[i - 1].letter) == 0) {
        isGroupTitle = false;
      }

      if (isGroupTitle) {
        height += TITLE_HEIGHT;
        heightMap[_contacts[i].letter] = _totalHeight;
      }

      _totalHeight += height;
    }
  }

  scrollTo(double pos) {
    _scrollController.animateTo(pos,
      curve: Curves.easeOut, duration: Duration(milliseconds: 200));
  }

  getPos(dy) {
    int index = (dy ~/ tileHeight).clamp(0, INDEX_LETTERS.length - 1);

    double pos = heightMap[INDEX_LETTERS[index]];

    if (pos != null) {
      scrollTo(pos);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          controller: _scrollController,
          itemCount: _contacts.length + topItems.length,
          itemBuilder: (BuildContext context, int index) {
            Contact contact;

            bool isGroupTitle = true;

            if (index < topItems.length) {
              isGroupTitle = false;
              contact = topItems[index];
            } else {
              index = index - topItems.length;
              contact = _contacts[index];

              if (index >= 1 && contact.letter == _contacts[index - 1].letter) {
                isGroupTitle = false;
              }
            }

            return ContactItem(contact: contact, isGroupTitle: isGroupTitle);
          },
        ),
        Positioned(
          width: 30.0,
          top: 20.0,
          key: indexBarKey,
          
          right: 0.0,
          bottom: 20.0,
          child: GestureDetector(
            onVerticalDragDown: (DragDownDetails details) {
              if (tileHeight == 0) {
                RenderObject renderObject = indexBarKey.currentContext.findRenderObject();

                double height = renderObject.semanticBounds.size.height;
                tileHeight = height / INDEX_LETTERS.length;
              }

              getPos(details.localPosition.dy);
            },
            onVerticalDragEnd: (DragEndDetails details) {
              print('dragend');
            },
            onVerticalDragCancel: () {
              print('dragcancel');
            },
            onVerticalDragUpdate: (DragUpdateDetails details) {
              getPos(details.localPosition.dy);
            },
            child: Column(
              children: INDEX_LETTERS.map((String letter) {
                return Expanded(
                  child: Text(letter,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(currentLetter == letter ? AppColors.wechatColor : AppColors.textColor)
                  ),),
                );
              }).toList(),
            ),
          )
        )
      ],
    );
  }
}