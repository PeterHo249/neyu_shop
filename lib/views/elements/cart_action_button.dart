import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:provider/provider.dart';

class CartActionButton extends StatefulWidget {
  CartActionButton({
    this.action,
  });

  final void Function()? action;

  @override
  _CartActionButtonState createState() => _CartActionButtonState(action);
}

class _CartActionButtonState extends State<CartActionButton> {
  _CartActionButtonState(this.action);

  void Function()? action;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DataProvider.instance.currentOrder,
      child: InkWell(
        onTap: action,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Center(
            child: getWindowType(MediaQuery.of(context).size.width) !=
                    WindowType.small
                ? Text(
                    'Cart (${DataProvider.instance.currentOrder.computeAmount()})',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  )
                : _buildCartIcon(
                    DataProvider.instance.currentOrder.computeAmount()),
          ),
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
