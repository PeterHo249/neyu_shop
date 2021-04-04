import 'package:flutter/material.dart';

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
      child: ElevatedButton(
        onPressed: action,
        child: Text('Add to cart'),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(
              15.0,
            ),
          ),
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 16.0,
          )),
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.hovered))
                return Colors.amber[400];
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.amber[60];
              return Colors.amber;
            },
          ),
        ),
      ),
    );
  }
}
