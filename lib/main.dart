import 'package:flutter/material.dart';
import 'views/homepage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final theme = ThemeData(
    backgroundColor: Colors.amber.shade600,
    fontFamily: 'ChakraPetch',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
