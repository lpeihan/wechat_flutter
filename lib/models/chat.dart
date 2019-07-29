import 'package:flutter/material.dart';

class Conversation {
  final String avatar;
  final String title;
  final bool isMute;
  final int unreadMsgCount;
  final List messages;
  final String type;
  final String updateAt;

  Conversation({
    @required this.avatar,
    @required this.title,
    this.isMute,
    this.unreadMsgCount,
    this.messages,
    this.type,
    this.updateAt
  }) : assert(avatar != null), assert(title != null);
}

List<Conversation> conversations = [
  Conversation(
    avatar: 'assets/images/ic_weixin.png',
    title: '微信运动',
    unreadMsgCount: 2,
    isMute: true,
    type: 'sport',
    updateAt: '20:56',
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
    updateAt: '17:01',
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
        'updateAt': '07-28 17:01',
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
    updateAt: '16:44',
    messages: [
      {
        'avatar': '',
        'content': '小李子',
        'updateAt': '17:56',
        'self': false,
        'id': 42
      },
      {
        'avatar': '',
        'content': "你忙好了吗",
        'updateAt': '',
        'self': false,
        'id': 42
      },
      {
        'avatar': '',
        'content': "我在写代码，今晚可能要通宵了",
        'updateAt': '',
        'self': true,
        'id': 42
      },
      {
        'avatar': '',
        'content': "那我先去洗澡了",
        'updateAt': '',
        'self': false,
        'id': 42
      }
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/14.jpg',
    title: 'Tina Morgan',
    isMute: true,
    unreadMsgCount: 0,
    type: 'chat',
    updateAt: '17:00',
    messages: [
      {
        'avatar': '',
        'content': '在吗',
        'updateAt': '17:00',
        'self': false,
        'id': 23
      },
      {
        'avatar': '',
        'content': '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
        'updateAt': '',
        'self': false,
        'id': 23
      }
    ]
  ),
  Conversation(
    avatar: 'assets/images/ic_fengchao.png',
    title: '蜂巢智能柜',
    isMute: false,
    unreadMsgCount: 0,
    type: 'public',
    updateAt: '19:32',
    messages: [
      {
        'avatar': '',
        'content': '暑假补课的真相，坑害了多少孩子，家长该醒醒了！',
        'updateAt': '07-23 19:32',
        'self': false,
        'picUrl': 'https://mmbiz.qpic.cn/mmbiz_jpg/gsuXdfST7jdibMpOvBBaMHZqcpTYgXKCDedXm4y1U9Sd9EjX4ksKnNeIIxOFwyo4kTIcHoTQjsQ1NPfMmnTibjeQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1',
        'url': 'https://mp.weixin.qq.com/s/ajqmWZVmQWKXIvsQJeEZzQ'
      },
      {
        'avatar': '',
        'content': '人到30岁：常常成熟，偶尔幼稚',
        'updateAt': '07-21 09:09',
        'self': false,
        'picUrl': 'https://mmbiz.qpic.cn/mmbiz_jpg/IpdzY56p0fp5biat3VCplBgwO2CiaIU9sib4Et5hQUFuJeqWu2QRFI3JjOF5zlEtF7jAOObiaertEjeZolUW8R15oQ/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1',
        'url': 'https://mp.weixin.qq.com/s/l0-G3E-9UE9e3vRWk4Lzxg'
      }
    ]
  ),
  Conversation(
    avatar: 'assets/images/ic_wx_games.png',
    title: '微信游戏',
    unreadMsgCount: 0,
    isMute: false,
    type: 'public',
    updateAt: '01:38',
    messages: [
      {
        'avatar': '',
        'content': '新等级即将开放？嘉年华爆料大猜想',
        'self': false,
        'updateAt': '07-21 01:38',
        'picUrl': 'https://mmbiz.qpic.cn/mmbiz_jpg/4I2X6lxJlUcPE9v9G7cIzhQn7jmZYKaBI23f5RZ8VFORmmNeecwQib5bY7xs7gG1icGebfnJmLRkIXS2Eeod1gNg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1',
        'url': 'https://mp.weixin.qq.com/s/-LAty-ipBmyDRZAPQZOp6g'
      },
      {
        'avatar': '',
        'content': '这个特别的日子，就让我来做你的“白色恋人”吧！',
        'self': false,
        'updateAt': '07-21 09:12',
        'picUrl': 'https://mmbiz.qpic.cn/mmbiz_jpg/4I2X6lxJlUckVHPL6yt8tWRsF6UfMwCBiaYQpnLaujkQe1Mb48rcRAUNibl67vPb5sByfiaDODbZbiafmxdicNpw9Zw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1',
        'url': 'https://mp.weixin.qq.com/s/87F13pkqW331ZPmfs6ZxDg'
      },
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    title: 'Lily',
    isMute: false,
    unreadMsgCount: 1,
    type: 'chat',
    updateAt: '昨天',
    messages: [
      {
        'avatar': '',
        'content': '今天要去运动场锻炼吗？',
        'self': false,
        'updateAt': '12:12',
        'id': 43,
      },
    ]
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/17.jpg',
    title: '汤姆丁',
    isMute: false,
    unreadMsgCount: 0,
    type: 'chat',
    updateAt: '昨天',
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
    avatar: 'https://randomuser.me/api/portraits/women/59.jpg',
    title: '小美',
    isMute: false,
    unreadMsgCount: 0,
    type: 'chat',
    updateAt: '昨天',
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
    updateAt: '周二',
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
    updateAt: '07-12',
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
    updateAt: '07-13',
    messages: [
      {
        'avatar': '',
        'content': '明天请你看电影，不见不散',
        'self': false,
        'updateAt': '7月12号'
      }
    ]
  ),
];