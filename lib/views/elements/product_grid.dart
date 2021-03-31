import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.blue.shade100,
        width: 500,
        height: 500,
        child: Text(
          'This is product list',
        ),
      ),
    );
  }
}
