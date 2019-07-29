import 'package:flutter/material.dart';

class Conversation {
  final String avatar;
  final String title;
  final bool isMute;
  final int unreadMsgCount;
  final List messages;
  final String type;

  Conversation({
    @required this.avatar,
    @required this.title,
    this.isMute,
    this.unreadMsgCount,
    this.messages,
    this.type
  }) : assert(avatar != null), assert(title != null);
}

List<Conversation> conversations = [
  Conversation(
    avatar: 'assets/images/ic_weixin.png',
    title: '微信运动',
    unreadMsgCount: 2,
    isMute: true,
    type: 'sport',
    messages: [
      {
        'avatar': '',
        'content': '[应用消息]',
        'updateAt': '20:56',
        'self': false
      },
      {
        'avatar': '',
        'content': '[应用消息]',
        'updateAt': '20:56',
        'self': false
      }
    ]
  ),
  Conversation(
    avatar: 'assets/images/ic_tx_news.png',
    title: '腾讯新闻',
    unreadMsgCount: 0,
    isMute: false,
    type: 'public',
    messages: [
      {
        'avatar': '',
        'content': '《哪吒》首周票房破7亿创动画电影新纪录，不止逆天还“逆跌”',
        'updateAt': '07-28 12:25',
        'self': false,
        'picUrl': 'https://inews.gtimg.com/newsapp_bt/0/9853621795/1000'
      },
      {
        'avatar': '',
        'content': '马伊琍结束11年婚姻，为什么这场离婚是众望所归',
        'updateAt': '07-28 13:01',
        'self': false,
        'picUrl': 'https://inews.gtimg.com/newsapp_bt/0/8612966978/1000'
      }
    ]
  ),
  Conversation(
    avatar: 'http://p1.music.126.net/fD7IW_jB5A4oxaN5vQ2haw==/109951163813454382.jpg?param=177y177',
    title: 'Rose',
    isMute: false,
    unreadMsgCount: 1,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': 'Never let go.',
        'updateAt': '17:56',
        'self': true
      },
      {
        'avatar': '',
        'content': "I will never let go, Jack, I'll never let go",
        'updateAt': '',
        'self': false
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/14.jpg',
    title: 'Tina Morgan',
    isMute: true,
    unreadMsgCount: 0,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': '在吗',
        'updateAt': '17:00',
        'self': false
      },
      {
        'avatar': '',
        'content': '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
        'updateAt': '',
        'self': false
      },
      {
        'avatar': '',
        'content': '五年高考，三年模拟',
        'updateAt': '18:12',
        'self': true
      }
    ]
  ),
  Conversation(
    avatar: 'assets/images/ic_fengchao.png',
    title: '蜂巢智能柜',
    isMute: false,
    unreadMsgCount: 0,
    type: 'public',
    messages: [
      {
        'avatar': '',
        'content': '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
        'updateAt': '17:12',
        'self': false,
      }
    ]
  ),
  Conversation(
    avatar: 'assets/images/ic_wx_games.png',
    title: '微信游戏',
    unreadMsgCount: 0,
    isMute: false,
    type: 'public',
    messages: [
      {
        'avatar': '',
        'content': '5元现金助力开学季！',
        'self': false,
        'updateAt': '16:48'
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    title: 'Lily',
    isMute: false,
    unreadMsgCount: 12,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': '昨天'
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': ''
      },
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/17.jpg',
    title: '汤姆丁',
    isMute: false,
    unreadMsgCount: 0,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': '我通过了你的朋友验证请求，现在我们可以开始聊天了',
        'self': false,
        'updateAt': '昨天'
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/19.jpg',
    title: 'Tina Morgan',
    isMute: false,
    unreadMsgCount: 3,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': '你忙好了吗',
        'self': false,
        'updateAt': '昨天'
      },
      {
        'avatar': '',
        'content': '要直播吗要直播吗要直播吗要直播吗',
        'self': false,
        'updateAt': ''
      },
      {
        'avatar': '',
        'content': '那我先去洗澡了',
        'self': false,
        'updateAt': ''
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/59.jpg',
    title: '小美',
    isMute: false,
    unreadMsgCount: 0,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': '昨天'
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/22.jpg',
    title: 'Jocky',
    isMute: true,
    unreadMsgCount: 0,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': '代码写完提交了，你有空验收一下',
        'self': false,
        'updateAt': '昨天'
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/15.jpg',
    title: 'Tina Morgan',
    isMute: false,
    unreadMsgCount: 1,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': '今天和我一起回家吗',
        'updateAt': '周三',
        'self': false
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/58.jpg',
    title: 'Lily',
    isMute: false,
    unreadMsgCount: 0,
    type: 'chat',
    messages: [
      {
        'avatar': '',
        'content': '明天请你看电影，不见不散',
        'self': false,
        'updateAt': '17月12号'
      }
    ]
  ),
];