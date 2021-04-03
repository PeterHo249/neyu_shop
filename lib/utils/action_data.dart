import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionData {
  final IconData icon;
  final String title;
  final void Function()? action;

  ActionData({
    required this.icon,
    required this.title,
    required this.action,
  });
}

class ActionDataEnum {
  static final contact = ActionData(
    icon: Icons.local_phone,
    title: "Contact",
    action: () => print('This is contact action'),
  );

  static final cart = ActionData(
    icon: Icons.shopping_cart_outlined,
    title: "Cart",
    action: () => print('This is cart action'),
  );

  static final actionDatas = [
    cart,
  ];
}
