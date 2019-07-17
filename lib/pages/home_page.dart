import 'package:flutter/material.dart';
import 'package:wechat_flutter/constants/app_colors.dart';
import 'package:wechat_flutter/constants/icon_font.dart';
import 'package:wechat_flutter/pages/contact_page.dart';
import 'package:wechat_flutter/pages/discover_page.dart';
import 'package:wechat_flutter/pages/profile_page.dart';
import 'package:wechat_flutter/pages/wechat_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  List<_BottomNavItem> _bottomNavItems = [
    _BottomNavItem(
      icon: Icon(IconFont.iconmessage, size: 22.0),
      activeIcon: Icon(IconFont.iconmessage_active, size: 22.0),
      title: '微信',
      page: WechatPage()
    ),
    _BottomNavItem(
      icon: Icon(IconFont.iconconcact, size: 28.0,),
      activeIcon: Icon(IconFont.iconconcact_active, size: 28.0,),
      title: '通讯录',
      page: ContactPage()
    ),
    _BottomNavItem(
      icon: Icon(IconFont.icondiscover,  size: 22.0),
      activeIcon: Icon(IconFont.icondiscover_active, size: 22.0),
      title: '发现',
      page: DiscoverPage()
    ),
    _BottomNavItem(
      icon: Icon(IconFont.iconprofile),
      activeIcon: Icon(IconFont.iconprofile_active),
      title: '我',
      page: ProfilePage()
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
              Navigator.of(context).pushNamed('/search');
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
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _bottomNavItems[index].page;
        },
        controller: _pageController,
        itemCount: _bottomNavItems.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
            _pageController.jumpToPage(_currentIndex);
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