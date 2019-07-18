import 'package:flutter/material.dart';

class Contact {
  const Contact({
    @required this.avatar,
    @required this.name,
    this.letter,
  });

  final String avatar;
  final String name;
  final String letter;
}

const INDEX_LETTERS = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

List<Contact> contacts = [
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/53.jpg',
    name: 'Maurice Sutton',
    letter: 'M',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/76.jpg',
    name: 'Jerry',
    letter: 'J',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
    name: 'Dangdang',
    letter: 'D',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/55.jpg',
    name: 'Teddy',
    letter: 'T',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
    name: 'Steave',
    letter: 'S',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
    name: 'Vivian',
    letter: 'V',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/50.jpg',
    name: 'Mary',
    letter: 'M',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/91.jpg',
    name: 'David',
    letter: 'D',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
    name: 'Bob',
    letter: 'B',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/60.jpg',
    name: 'Jeff Green',
    letter: 'J',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/45.jpg',
    name: 'Adam',
    letter: 'A',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/7.jpg',
    name: 'Michel',
    letter: 'M',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/35.jpg',
    name: 'Green',
    letter: 'G',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/64.jpg',
    name: 'Jack Ma',
    letter: 'J',
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/86.jpg',
    name: 'Tom',
    letter: 'T',
  ),
  const Contact(
    avatar:
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537868900176&di=ddbe94a75a3cc33f880a5f3f675b8acd&imgtype=0&src=http%3A%2F%2Fs2.sinaimg.cn%2Fmw690%2F003wRTwMty6IGZWzd2p31',
    name: '张伟',
    letter: 'Z',
  ),
  const Contact(
    avatar:
        'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1537858866&di=fe35e4465c73122f14e1c9475dd68e47&src=http://a2.att.hudong.com/63/26/01300001128119143503262347361.jpg',
    name: '张益达',
    letter: 'Z',
  ),
];