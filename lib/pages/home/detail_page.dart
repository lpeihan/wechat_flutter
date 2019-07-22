import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wechat_flutter/constants/icon_font.dart';

class DetailPage extends StatelessWidget {
  final Map arguments;
  const DetailPage({Key key, this.arguments}) : super(key: key);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(arguments['title'], style: TextStyle(fontSize: 17.0),),
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
        padding: EdgeInsets.only(top: 100.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text('功能正在开发中，具体请关注', style: TextStyle(fontSize: 16.0),),
            SizedBox(height: 20.0,),
            InkWell(
              child: Image.asset('assets/images/github.png', width: 50,),
              onTap: () {
                _launchURL('https://github.com/lpeihan/wechat_flutter');
              },
            )
          ],
        )
      ),
    );
  }
}