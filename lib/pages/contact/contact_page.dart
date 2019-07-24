import 'package:flutter_web/material.dart';
import 'package:wechat_flutter/components/we_image.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/models/contact.dart'
    show contacts, Contact, INDEX_LETTERS;

const double TITLE_HEIGHT = 24;
const double ITEM_HEIGHT = 64;

class ContactItem extends StatelessWidget {
  final bool isGroupTitle;
  final Contact contact;

  const ContactItem({Key key, this.isGroupTitle, @required this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildWidget = [];

    if (isGroupTitle) {
      _buildWidget.add(
        Container(
          height: TITLE_HEIGHT,
          padding: EdgeInsets.only(left: 15.0),
          color: AppColors.primaryColor,
          alignment: Alignment.centerLeft,
          child: Text(
            contact.letter,
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      );
    }

    _buildWidget.add(Container(
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
              child: Text(
                contact.name,
                style: TextStyle(fontSize: 16.0),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 0.5, color: AppColors.borderColor))),
            ),
          )
        ],
      ),
    ));

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/detail', arguments: { 'title': contact.name });
      },
      child: Column(children: _buildWidget),
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
  final Map heightMap = {INDEX_LETTERS[0]: 0.0};
  double tileHeight = 0;
  String currentLetter = INDEX_LETTERS[0];
  String dragingLetter = '';

  List<Contact> topItems = [
    Contact(
      avatar: 'images/ic_new_friend.png',
      name: '新的朋友',
    ),
    Contact(
      avatar: 'images/ic_group_chat.png',
      name: '群聊',
    ),
    Contact(
      avatar: 'images/ic_tag.png',
      name: '标签',
    ),
    Contact(
      avatar: 'images/ic_public_account.png',
      name: '公众号',
    ),
  ];

  GlobalKey indexBarKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _contacts
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
        currentLetter = nearLetter;
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

    for (int i = 0; i < _contacts.length; i++) {
      bool isGroupTitle = true;
      double height = ITEM_HEIGHT;

      if (i >= 1 &&
          _contacts[i].letter.compareTo(_contacts[i - 1].letter) == 0) {
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

    setState(() {
      dragingLetter = INDEX_LETTERS[index];
    });

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
            // key: indexBarKey,
            right: 0.0,
            bottom: 20.0,
            child: Container(child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return GestureDetector(
                onVerticalDragDown: (DragDownDetails details) {
                  // RenderObject renderObject = indexBarKey.currentContext.findRenderObject();
                  RenderBox renderObject = context.findRenderObject();
                  if (tileHeight == 0) {
                    double height = renderObject.semanticBounds.size.height;
                    tileHeight = height / INDEX_LETTERS.length;
                  }

                  var localPostion =
                      renderObject.globalToLocal(details.globalPosition);

                  getPos(localPostion.dy);
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  setState(() {
                    dragingLetter = '';
                  });
                },
                onVerticalDragCancel: () {
                  setState(() {
                    dragingLetter = '';
                  });
                },
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  RenderBox renderObject = context.findRenderObject();
                  var localPostion = renderObject.globalToLocal(details.globalPosition);

                  getPos(localPostion.dy);
                },
                child: Column(
                  children: INDEX_LETTERS.map((String letter) {
                    return Expanded(
                      child: Text(
                        letter,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: currentLetter == letter
                                ? AppColors.primaryColor
                                : AppColors.grey1),
                      ),
                    );
                  }).toList(),
                ),
              );
            }))),
        dragingLetter.length > 0
            ? Center(
                child: Container(
                  width: 114.0,
                  height: 114.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Text(
                    dragingLetter,
                    style: TextStyle(fontSize: 64.0, color: Colors.white),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
