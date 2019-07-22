import 'package:flutter/material.dart';
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
    );
  }
}
