// ignore: import_of_legacy_library_into_null_safe
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/order.dart';
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
      child: Consumer<Order>(
        builder: (context, model, _) {
          return InkWell(
            onTap: action,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Center(
                child: _buildCartIcon(model.computeAmount()),
              ),
            ),
          );
        },
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
