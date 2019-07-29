import 'package:flutter/material.dart';

class Profile {
  final String name;
  final String avatar;
  final String account;

  const Profile({
    @required this.name,
    @required this.avatar,
    @required this.account,
  });
}
const userInfo = Profile(
  name: 'Jack',
  avatar: 'https://p2.music.126.net/2MsstS-M9w5-li0aRy3sUQ==/1380986606815861.jpg',
  account: 'Leonardo DiCaprio'
);