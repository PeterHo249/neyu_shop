import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';

class CartActionButton extends StatefulWidget {
  CartActionButton({
    this.action,
    this.productCount = 0,
  });

  final void Function()? action;
  final int productCount;

  @override
  _CartActionButtonState createState() =>
      _CartActionButtonState(action, productCount);
}

class _CartActionButtonState extends State<CartActionButton> {
  _CartActionButtonState(this.action, this.productCount);

  int productCount;
  void Function()? action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Center(
          child: getWindowType(MediaQuery.of(context).size.width) !=
                  WindowType.small
              ? Text(
                  'Cart ($productCount)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                )
              : _buildCartIcon(productCount),
        ),
      ),
    );
  }

  Widget _buildCartIcon(int count) {
    return Badge(
      badgeColor: Colors.red,
      badgeContent: Text(
        '$count',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      child: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.black,
        size: 30.0,
      ),
    );
  }
}
