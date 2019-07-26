import 'package:flutter/material.dart';

class Contact {
  const Contact({
    @required this.avatar,
    @required this.name,
    this.letter,
    this.area,
    this.sex
  });

  final String avatar;
  final String name;
  final String letter;
  final String area;
  final int sex;
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
    avatar: 'https://randomuser.me/api/portraits/women/12.jpg',
    name: 'Alin',
    letter: 'A',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/45.jpg',
    name: 'Adam',
    letter: 'A',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/18.jpg',
    name: 'Asya',
    letter: 'A',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
    name: 'Bob',
    letter: 'B',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/32.jpg',
    name: 'Brion',
    letter: 'B',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/12.jpg',
    name: 'Barnabas',
    letter: 'B',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
    name: 'Dangdang',
    letter: 'D',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/91.jpg',
    name: 'David',
    letter: 'D',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/91.jpg',
    name: 'David',
    letter: 'D',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/76.jpg',
    name: 'Jerry',
    letter: 'J',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/60.jpg',
    name: 'Jeff Green',
    letter: 'J',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/64.jpg',
    name: 'Jack Ma',
    letter: 'J',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/64.jpg',
    name: 'Jack Ma',
    letter: 'J',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/53.jpg',
    name: 'Maurice Sutton',
    letter: 'M',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/53.jpg',
    name: 'Maurice Sutton',
    letter: 'M',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/7.jpg',
    name: 'Michel',
    letter: 'M',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/7.jpg',
    name: 'Michel',
    letter: 'M',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/50.jpg',
    name: 'Mary',
    letter: 'M',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
    name: 'Steave',
    letter: 'S',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
    name: 'Steave',
    letter: 'S',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
    name: 'Steave',
    letter: 'S',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
    name: 'Steave',
    letter: 'S',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/55.jpg',
    name: 'Teddy',
    letter: 'T',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/55.jpg',
    name: 'Teddy',
    letter: 'T',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
    name: 'Vivian',
    letter: 'V',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
    name: 'Vivian',
    letter: 'V',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
    name: 'Vivian',
    letter: 'V',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
    name: 'Vivian',
    letter: 'V',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/35.jpg',
    name: 'Green',
    letter: 'G',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/86.jpg',
    name: 'Tom',
    letter: 'T',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/20.jpg',
    name: 'Yekaterna',
    letter: 'Y',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/21.jpg',
    name: 'Yekaterna',
    letter: 'Y',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/22.jpg',
    name: 'Yekaterna',
    letter: 'Y',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/66.jpg',
    name: 'Zeeshan',
    letter: 'Z',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/70.jpg',
    name: 'Zeger Zii',
    letter: 'Z',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/73.jpg',
    name: 'Zcoco coco',
    letter: 'Z',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/74.jpg',
    name: 'Zihell',
    letter: 'Z',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/75.jpg',
    name: 'Zaneta',
    letter: 'Z',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/76.jpg',
    name: 'Zoie',
    letter: 'Z',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/women/77.jpg',
    name: 'Zosia',
    letter: 'Z',
    area: '福建 厦门',
    sex: 0,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/78.jpg',
    name: 'Zuhal',
    letter: 'Z',
    area: '福建 厦门',
    sex: 1,
  ),
  const Contact(
    avatar: 'https://randomuser.me/api/portraits/men/79.jpg',
    name: 'Zella',
    letter: 'Z',
    area: '福建 厦门',
    sex: 1,
  ),
];