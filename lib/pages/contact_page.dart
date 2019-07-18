import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/models/contacts.dart';


class ContactItem extends StatelessWidget {
  final bool isGroupTitle;
  final Contact contact;

  const ContactItem({Key key, this.isGroupTitle, @required this.contact}) : super(key: key);

  bool get isAvatarFromNet {
    return contact.avatar.startsWith('http');
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildWidget = [];

    if (isGroupTitle) {
      _buildWidget.add(
       Container(
          height: 24.0,
          padding: EdgeInsets.only(left: 15.0),
          color: Color(AppColors.primaryColor),
          alignment: Alignment.centerLeft,
          child: Text(contact.nameIndex, style: TextStyle(fontSize: 12.0),),
        ),
      );
    }

    _buildWidget.add(
      Container(
        padding: EdgeInsets.only(left: 15.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: isAvatarFromNet ? NetworkImage(contact.avatar) : AssetImage(contact.avatar), fit: BoxFit.cover
                )
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                height: 64.0,
                margin: EdgeInsets.only(left: 15.0),
                child: Text(contact.name),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(AppColors.borderColor))
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

  List<Contact> topItems = [
    Contact(
      avatar: 'assets/images/ic_new_friend.png',
      name: '新的朋友',
      nameIndex: ''
    ),
    Contact(
      avatar: 'assets/images/ic_group_chat.png',
      name: '群聊',
      nameIndex: ''
    ),
    Contact(
      avatar: 'assets/images/ic_tag.png',
      name: '标签',
      nameIndex: ''
    ),
    Contact(
      avatar: 'assets/images/ic_public_account.png',
      name: '公众号',
      nameIndex: ''
    ),
  ];

  @override
  void initState() {
    super.initState();
  

    _contacts
      ..addAll(contacts)
      ..addAll(contacts)
      ..addAll(contacts)
      ..sort((a, b) => a.nameIndex.compareTo(b.nameIndex));
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (BuildContext context, int index) {
        Contact contact = _contacts[index];

        bool isGroupTitle = true;

        if (index >= 1 && contact.nameIndex == _contacts[index - 1].nameIndex) {
          isGroupTitle = false;
        }

        if (index < topItems.length) {
          isGroupTitle = false;
          contact = topItems[index];
        }

        return ContactItem(contact: contact, isGroupTitle: isGroupTitle);
      },
    );
  }
}