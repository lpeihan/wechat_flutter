import 'package:flutter/material.dart';
import 'package:wechat_flutter/components/we_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10.0,),
        WeImage(
          image: 'assets/images/ic_file_transfer.png',
        ),
      ],
    );
  }
}