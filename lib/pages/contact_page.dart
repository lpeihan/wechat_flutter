import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/models/contacts.dart';



class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> _contacts = [];

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

        return Column(
          children: <Widget>[
            Container(
              height: 24.0,
              padding: EdgeInsets.only(left: 15.0),
              color: Color(0xffefefef),
              alignment: Alignment.centerLeft,
              child: Text(contact.nameIndex, style: TextStyle(fontSize: 12.0),),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: NetworkImage(contact.avatar), fit: BoxFit.cover
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 60.0,
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
          ],
        );
      },
    );
  }
}