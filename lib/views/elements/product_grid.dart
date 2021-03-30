import 'package:flutter/material.dart';
import 'package:neyu_shop/models/product.dart';

class ProductGrid extends StatelessWidget {
  final productList = [
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 1',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 2',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 3',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 4',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 5',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 6',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 7',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 8',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 9',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 10',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 11',
      500000,
    ),
    Product(
      '1',
      'assets/img/placeholder.png',
      'product 12',
      500000,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisExtent: 15.0,
        crossAxisSpacing: 15.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          width: 50,
        );
      },
    );
  }
}
