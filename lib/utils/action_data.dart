import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionData {
  final IconData icon;
  final String title;

  ActionData({required this.icon, required this.title});
}

class ActionDataEnum {
  static final contact = ActionData(
    icon: Icons.local_phone,
    title: "Contact",
  );

  static final actionDatas = [
    contact,
  ];
}
