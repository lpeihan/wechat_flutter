import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  List<_PopupMenuItem> _popupMenuItems = [
    _PopupMenuItem(
      icon: Icon(IconFont.iconmessage_active, color: Colors.white,),
      title: '发起群聊'
    ),
    _PopupMenuItem(
      icon: Icon(IconFont.iconfriends, color: Colors.white, size: 28.0,),
      title: '添加朋友'
    ),
    _PopupMenuItem(
      icon: Icon(IconFont.iconyuyin, color: Colors.white,),
      title: '扫一扫'
    ),
    _PopupMenuItem(
      icon: Icon(IconFont.iconpay, color: Colors.white,),
      title: '收付款'
    ),
    _PopupMenuItem(
      icon: Icon(IconFont.iconhelp, color: Colors.white,),
      title: '帮助与反馈'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    AppBar _appBar;

    if (_currentIndex <= 2) {
      _appBar = AppBar(
        title: Text(_bottomNavItems[_currentIndex].title, style: TextStyle(fontSize: 17.0),),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(IconFont.iconsearch, size: 20.0),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
          SizedBox(width: 10.0),
          Theme(
            data: ThemeData(cardColor: Color(AppColors.primaryBackground)),
            child: PopupMenuButton(
              padding: EdgeInsets.all(0.0),
              offset: Offset(0, 150),
              icon: Icon(IconFont.iconadd, size: 24.0),
              itemBuilder: (BuildContext context) {
                return _popupMenuItems.map((_PopupMenuItem item) {
                  return PopupMenuItem(
                    child: Row(
                      children: <Widget>[
                        item.icon,
                        Container(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(item.title, style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ),
          SizedBox(width: 10.0),
        ],
      );
    } else {
      _appBar = AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(IconFont.iconcamera, size: 20.0,),
            onPressed: () {},
          ),
          SizedBox(width: 5.0,)
        ],
      );
    }


    return Scaffold(
      appBar: _appBar,
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

class _PopupMenuItem {
  final Icon icon;
  final String title;

  _PopupMenuItem({this.icon, this.title});
}