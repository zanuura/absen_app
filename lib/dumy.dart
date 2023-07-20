import 'package:flutter/material.dart';

List<Map<String, dynamic>> scheduleListData = [
  {
    'id': '1',
    'day': 'Senin',
    'subjects': scheduleSubjectData,
  },
  {
    'id': '2',
    'day': 'Selasa',
    'subjects': scheduleSubjectData,
  },
  {
    'id': '3',
    'day': 'Rabu',
    'subjects': scheduleSubjectData,
  },
  {
    'id': '4',
    'day': 'kamis',
    'subjects': scheduleSubjectData,
  },
  {
    'id': '5',
    'day': 'Jumat',
    'subjects': scheduleSubjectData,
  },
];

List<Map<String, dynamic>> scheduleSubjectData = [
  // {
  //   'id': '',
  //   'subject': '',
  //   'teacher': '',
  //   'time': '',
  // },
  {
    'id': '1',
    'subject': [
      'Mtk',
      'IPA',
      'Indo',
      'IPS',
    ],
    'teacher': [
      'Rosa',
      'Sri',
      'Ayu',
      'Ujang',
    ],
    'time': [
      '07.05 - 08.00',
      '08.00 - 09.00',
      '09.00 - 10.00',
      '11.00 - 12.00',
    ],
  },
  {
    'id': '2',
    'subject': ['Mtk', 'IPA', 'Indo', 'IPS', 'Sunda'],
    'teacher': ['Rosa', 'Sri', 'Ayu', 'Ujang', 'Jono'],
    'time': [
      '07.05 - 08.00',
      '08.00 - 09.00',
      '09.00 - 10.00',
      '11.00 - 12.00',
      '01.00 - 02.00'
    ],
  },
  {
    'id': '3',
    'subject': ['Mtk', 'IPA', 'Indo', 'IPS', 'Sunda'],
    'teacher': ['Rosa', 'Sri', 'Ayu', 'Ujang', 'Jono'],
    'time': [
      '07.05 - 08.00',
      '08.00 - 09.00',
      '09.00 - 10.00',
      '11.00 - 12.00',
      '01.00 - 02.00'
    ],
  },
  {
    'id': '4',
    'subject': ['IPA', 'Indo', 'IPS', 'Sunda'],
    'teacher': ['Sri', 'Ayu', 'Ujang', 'Jono'],
    'time': [
      '08.00 - 09.00',
      '09.00 - 10.00',
      '11.00 - 12.00',
      '01.00 - 02.00'
    ],
  },
  {
    'id': '5',
    'subject': ['Mtk', 'IPA', 'Indo', 'IPS', 'Sunda'],
    'teacher': ['Rosa', 'Sri', 'Ayu', 'Ujang', 'Jono'],
    'time': [
      '07.05 - 08.00',
      '08.00 - 09.00',
      '09.00 - 10.00',
      '11.00 - 12.00',
      '01.00 - 02.00'
    ],
  },
];

List<Map<String, dynamic>> scheduleSubjectData1 = [
  {
    'id': '',
    'subject': '',
    'teacher': '',
    'time': '',
  },
  {
    'id': '3',
    'subject': 'IPA',
    'teacher': 'Husni',
    'time': '10.00 - 11.00',
  },
  {
    'id': '1',
    'subject': 'Mtk',
    'teacher': 'Rosa',
    'time': '07.05 - 08.00',
  },
  {
    'id': '2',
    'subject': 'Indo',
    'teacher': 'Budi Asuh',
    'time': '08.00 - 09.00',
  },
  {
    'id': '3',
    'subject': 'IPA',
    'teacher': 'Husni',
    'time': '10.00 - 11.00',
  },
];

List<Map<String, dynamic>> scheduleSubjectData2 = [
  {
    'id': '',
    'subject': '',
    'teacher': '',
    'time': '',
  },
  {
    'id': '1',
    'subject': 'Mtk',
    'teacher': 'Rosa',
    'time': '07.05 - 08.00',
  },
  {
    'id': '3',
    'subject': 'IPA',
    'teacher': 'Husni',
    'time': '10.00 - 11.00',
  },
  {
    'id': '4',
    'subject': 'IPS',
    'teacher': 'Surya Tanah',
    'time': '11.00 - 12.00',
  },
];

List<Map<String, dynamic>> scheduleSubjectData3 = [
  {
    'id': '',
    'subject': '',
    'teacher': '',
    'time': '',
  },
  {
    'id': '1',
    'subject': 'Mtk',
    'teacher': 'Rosa',
    'time': '07.05 - 08.00',
  },
  {
    'id': '2',
    'subject': 'Indo',
    'teacher': 'Budi Asuh',
    'time': '08.00 - 09.00',
  },
  {
    'id': '4',
    'subject': 'IPS',
    'teacher': 'Surya Tanah',
    'time': '11.00 - 12.00',
  },
];

List<Map<String, dynamic>> scheduleSubjectData4 = [
  {
    'id': '',
    'subject': '',
    'teacher': '',
    'time': '',
  },
  {
    'id': '1',
    'subject': 'Mtk',
    'teacher': 'Rosa',
    'time': '07.05 - 08.00',
  },
  {
    'id': '2',
    'subject': 'Indo',
    'teacher': 'Budi Asuh',
    'time': '08.00 - 09.00',
  },
  {
    'id': '3',
    'subject': 'IPA',
    'teacher': 'Husni',
    'time': '10.00 - 11.00',
  },
  {
    'id': '4',
    'subject': 'IPS',
    'teacher': 'Surya Tanah',
    'time': '11.00 - 12.00',
  },
];

List<Map<String, dynamic>> scheduleSubjectData5 = [
  {
    'id': '',
    'subject': '',
    'teacher': '',
    'time': '',
  },
  {
    'id': '1',
    'subject': 'Mtk',
    'teacher': 'Rosa',
    'time': '07.05 - 08.00',
  },
  {
    'id': '2',
    'subject': 'Indo',
    'teacher': 'Budi Asuh',
    'time': '08.00 - 09.00',
  },
  {
    'id': '3',
    'subject': 'IPA',
    'teacher': 'Husni',
    'time': '10.00 - 11.00',
  },
  {
    'id': '4',
    'subject': 'IPS',
    'teacher': 'Surya Tanah',
    'time': '11.00 - 12.00',
  },
];
