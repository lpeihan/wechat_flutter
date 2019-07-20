import 'package:flutter_web/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';

class WeTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool borderBottom;
  final Function onPressed;

  const WeTile({
    Key key,
    this.iconPath,
    this.title,
    this.borderBottom = false,
    @required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      onPressed: onPressed,
      padding: EdgeInsets.only(right: 0, left: 12.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Image.asset(iconPath, width: 24.0,),
            SizedBox(width: 15.0,),
            Expanded(
              child: Container(
                height: 54.0,
                decoration: BoxDecoration(
                  border: borderBottom ? Border(bottom: BorderSide(width: 0.5, color: Color(AppColors.borderColor))) : Border()
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(title, style: TextStyle(fontSize: 16.0),),
                    ),
                    Icon(IconFont.iconright, color: Color(AppColors.textGreyColor)),
                    SizedBox(width: 12.0,)
                  ],
                )
              )
            )
          ],
        ),
      ),
    );
  }
}