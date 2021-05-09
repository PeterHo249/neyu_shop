import 'package:flutter/material.dart';

class EmptyDataIndicator extends StatelessWidget {
  final String message;
  final IconData icon;
  final Widget? child;

  const EmptyDataIndicator({
    required this.message,
    this.icon = Icons.error_outline,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blueGrey,
          size: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: child ?? Container(),
        ),
      ],
    );
  }
}
