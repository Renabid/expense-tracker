import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData= [
  {
    'icon': FontAwesomeIcons.burger,
    'color': const Color(0xFF3C4858), // dark slate for Food
    'name': "Food",
    'totalAmount': '-100Tk',
    'date': "Today",
  },
  {
    'icon': FontAwesomeIcons.bagShopping,
    'color': const Color(0xFF2F5E63), // dark teal for Shopping
    'name': "Shopping",
    'totalAmount': '-450Tk',
    'date': "Yesterday",
  },
  {
    'icon': FontAwesomeIcons.heartCircleCheck,
    'color': const Color(0xFF1E3A5F), // dark navy for Health
    'name': "Health",
    'totalAmount': '-50Tk',
    'date': "Yesterday",
  },
  {
    'icon': FontAwesomeIcons.plane,
    'color': const Color(0xFF556877), // slightly lighter slate-blue for Travel
    'name': "Travel",
    'totalAmount': '-150Tk',
    'date': "Today",
  }
];
