import 'package:flutter/material.dart';

class Conversation {
  final String avatar;
  final String title;
  final int titleColor;
  final String desc;
  final String updateAt;
  final bool isMute;
  final int unreadMsgCount;
  final bool displayDot;
  final bool isAvatarLocal;

  Conversation({
    @required this.avatar,
    @required this.title,
    this.titleColor,
    this.desc,
    @required this.updateAt,
    this.isMute,
    this.unreadMsgCount,
    this.displayDot,
    this.isAvatarLocal
  }) : assert(avatar != null), assert(title != null), assert(updateAt != null);
}

List<Conversation> conversations = [
  Conversation(
    avatar: 'assets/images/ic_file_transfer.png',
    isAvatarLocal: true,
    title: '文件传输助手',
    titleColor: 0xff333333,
    desc: '',
    updateAt: '19:56',
    unreadMsgCount: 2,
    displayDot: true,
    isMute: false
  ),
  Conversation(
    avatar: 'assets/images/ic_tx_news.png',
    isAvatarLocal: true,
    title: '腾讯新闻',
    titleColor: 0xff333333,
    desc: '豪车与出租车刮擦 俩车主划拳定责',
    updateAt: '17:20',
    isMute: false,
  ),
  Conversation(
    avatar: 'assets/images/ic_wx_games.png',
    isAvatarLocal: true,
    title: '微信游戏',
    titleColor: 0xff586b95,
    desc: '25元现金助力开学季！',
    updateAt: '17:12',
    isMute: false,
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    isAvatarLocal: false,
    title: '汤姆丁',
    titleColor: 0xff333333,
    desc: '😃今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    isMute: true,
    unreadMsgCount: 0,
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    isAvatarLocal: false,
    title: 'Tina Morgan',
    titleColor: 0xff333333,
    desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    isMute: false,
    unreadMsgCount: 3,
  ),
  Conversation(
    avatar: 'assets/images/ic_fengchao.png',
    isAvatarLocal: true,
    title: '蜂巢智能柜',
    titleColor: 0xff586b95,
    desc: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
    isMute: false,
    updateAt: '17:12',
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    isAvatarLocal: false,
    title: 'Lily',
    titleColor: 0xff333333,
    desc: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 99,
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    isAvatarLocal: false,
    title: '汤姆丁',
    titleColor: 0xff333333,
    desc: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    isMute: true,
    unreadMsgCount: 0,
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    isAvatarLocal: false,
    title: 'Tina Morgan',
    titleColor: 0xff333333,
    desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    isMute: false,
    unreadMsgCount: 3,
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    isAvatarLocal: false,
    title: 'Lily',
    titleColor: 0xff333333,
    desc: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 0,
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    isAvatarLocal: false,
    title: '汤姆丁',
    titleColor: 0xff333333,
    desc: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    isMute: true,
    unreadMsgCount: 0,
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    isAvatarLocal: false,
    title: 'Tina Morgan',
    titleColor: 0xff333333,
    desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    isMute: false,
    unreadMsgCount: 1,
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    isAvatarLocal: false,
    title: 'Lily',
    titleColor: 0xff333333,
    desc: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 0,
  ),
];