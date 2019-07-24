import 'package:flutter_web/material.dart';

class Conversation {
  final String avatar;
  final String title;
  final int titleColor;
  final String desc;
  final String updateAt;
  final bool isMute;
  final int unreadMsgCount;
  final bool displayDot;
  final List messages;

  Conversation({
    @required this.avatar,
    @required this.title,
    this.titleColor,
    this.desc,
    @required this.updateAt,
    this.isMute,
    this.unreadMsgCount,
    this.displayDot,
    this.messages
  }) : assert(avatar != null), assert(title != null), assert(updateAt != null);
}

List<Conversation> conversations = [
  Conversation(
    avatar: 'images/ic_weixin.png',
    title: '微信运动',
    titleColor: 0xff333333,
    desc: '[应用消息]',
    updateAt: '20:56',
    unreadMsgCount: 2,
    displayDot: true,
    isMute: false,
    messages: [
      {
        'avatar': '',
        'content': '[应用消息]',
        'updateAt': '20:56',
        'self': false
      }
    ]
  ),
  Conversation(
    avatar: 'images/ic_tx_news.png',
    title: '腾讯新闻',
    titleColor: 0xff333333,
    unreadMsgCount: 0,
    desc: '豪车与出租车刮擦 俩车主划拳定责',
    updateAt: '18:20',
    isMute: false,
    displayDot: false,
    messages: [
      {
        'avatar': '',
        'content': '豪车与出租车刮擦 俩车主划拳定责',
        'updateAt': '18:20',
        'self': false
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/5.jpg',
    title: '小可爱',
    titleColor: 0xff333333,
    desc: '😃今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    isMute: false,
    unreadMsgCount: 1,
    displayDot: false,
    messages: [
      {
        'avatar': '',
        'content': '😃今晚要一起去吃肯德基吗？',
        'updateAt': '17:56',
        'self': false
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/14.jpg',
    title: 'Tina Morgan',
    titleColor: 0xff333333,
    desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:01',
    isMute: true,
    unreadMsgCount: 0,
    displayDot: false,
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
    avatar: 'images/ic_fengchao.png',
    title: '蜂巢智能柜',
    titleColor: 0xff586b95,
    desc: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
    isMute: false,
    updateAt: '17:12',
    unreadMsgCount: 0,
    displayDot: false,
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
    avatar: 'images/ic_wx_games.png',
    title: '微信游戏',
    titleColor: 0xff586b95,
    unreadMsgCount: 0,
    desc: '25元现金助力开学季！',
    updateAt: '16:48',
    isMute: false,
    displayDot: false,
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
    titleColor: 0xff333333,
    desc: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 12,
    displayDot: false,
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
    titleColor: 0xff333333,
    desc: '我通过了你的朋友验证请求，现在我们可以开始聊天了',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 0,
    displayDot: false,
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
    titleColor: 0xff333333,
    desc: '那我先去洗澡了',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 3,
    displayDot: false,
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
    titleColor: 0xff333333,
    desc: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 0,
    displayDot: false,
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
    titleColor: 0xff333333,
    desc: '代码写完提交了，你有空验收一下',
    updateAt: '昨天',
    isMute: true,
    unreadMsgCount: 0,
    displayDot: false,
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
    titleColor: 0xff333333,
    desc: '今天和我一起回家吗',
    updateAt: '周三',
    isMute: false,
    unreadMsgCount: 1,
    displayDot: false,
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
    titleColor: 0xff333333,
    desc: '明天请你看电影，不见不散',
    updateAt: '7月12号',
    isMute: false,
    unreadMsgCount: 0,
    displayDot: false,
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