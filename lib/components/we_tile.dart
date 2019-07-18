import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';

class WeTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool marginBottom;
  final bool borderBottom;

  const WeTile({Key key, this.iconPath, this.title, this.marginBottom = false, this.borderBottom = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: marginBottom ? 12.0 : 0.0),
        padding: EdgeInsets.only(left: 15.0),
        child: Row(
          children: <Widget>[
            Image.asset(iconPath, width: 28.0,),
            SizedBox(width: 15.0,),
            Expanded(
              child: Container(
                height: 54.0,
                alignment: Alignment.centerLeft,
                child: Text(title, style: TextStyle(fontSize: 16.0),),
                decoration: BoxDecoration(
                  border: borderBottom ? Border(bottom: BorderSide(width: 0.5, color: Color(AppColors.borderColor))) : Border()
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}