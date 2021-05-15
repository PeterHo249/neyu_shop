import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({required this.message, required this.onPressed});

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(message),
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
                states.contains(MaterialState.pressed)) return Colors.amber[60];
            return Colors.amber;
          },
        ),
      ),
    );
  }
}
