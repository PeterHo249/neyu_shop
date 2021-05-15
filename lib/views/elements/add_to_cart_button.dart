import 'package:flutter/material.dart';
import 'package:neyu_shop/views/elements/my_elevated_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    required this.action,
  });

  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: MyElevatedButton(
        onPressed: action!,
        message: 'Add to cart',
      ),
    );
  }
}
