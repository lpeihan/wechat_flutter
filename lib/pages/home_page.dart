import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/icon_font.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<_BottomNavItem> _bottomNavItems = [
    _BottomNavItem(
      icon: Icon(IconFont.iconmessage, size: 22.0),
      activeIcon: Icon(IconFont.iconmessage_active, size: 22.0),
      title: '微信'
    ),
    _BottomNavItem(
      icon: Icon(IconFont.iconconcact, size: 28.0,),
      activeIcon: Icon(IconFont.iconconcact_active, size: 28.0,),
      title: '通讯录'
    ),
    _BottomNavItem(
      icon: Icon(IconFont.icondiscover,  size: 22.0),
      activeIcon: Icon(IconFont.icondiscover_active, size: 22.0),
      title: '发现'
    ),
    _BottomNavItem(
      icon: Icon(IconFont.iconprofile),
      activeIcon: Icon(IconFont.iconprofile_active),
      title: '我'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(IconFont.iconsearch, size: 20.0),
            onPressed: () {
              print('iconsearch');
            },
          ),
          SizedBox(width: 10.0),
          IconButton(
            icon: Icon(IconFont.iconadd_, size: 24.0),
            onPressed: () {
              print('iconadd_');
            },
          ),
          SizedBox(width: 10.0),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavItems.map((_BottomNavItem item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            activeIcon: item.activeIcon,
            title: Text(item.title)
          );
        }).toList(),
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(AppColors.wechatColor),
        currentIndex: _currentIndex,
        selectedFontSize: 12.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _BottomNavItem {
  final Icon icon;
  final Icon activeIcon;
  final String title;
  final Widget page;

  _BottomNavItem({this.icon, this.activeIcon, this.title, this.page});
}