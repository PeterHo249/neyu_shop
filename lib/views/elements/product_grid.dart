import 'package:flutter/material.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:neyu_shop/views/elements/product_tile.dart';

class ProductGrid extends StatelessWidget {
  final productList = [
    Product(
      '1',
      'assets/img/product_1.jpg',
      'product 1',
      500000,
    ),
    Product(
      '2',
      'assets/img/product_2.jpg',
      'product 2',
      500000,
    ),
    Product(
      '3',
      'assets/img/product_1.jpg',
      'product 3',
      500000,
    ),
    Product(
      '4',
      'assets/img/product_2.jpg',
      'product 4',
      500000,
    ),
    Product(
      '5',
      'assets/img/product_1.jpg',
      'product 5',
      500000,
    ),
    Product(
      '6',
      'assets/img/product_2.jpg',
      'product 6',
      500000,
    ),
    Product(
      '7',
      'assets/img/product_1.jpg',
      'product 7',
      500000,
    ),
    Product(
      '8',
      'assets/img/product_2.jpg',
      'product 8',
      500000,
    ),
    Product(
      '9',
      'assets/img/product_1.jpg',
      'product 9',
      500000,
    ),
    Product(
      '10',
      'assets/img/product_2.jpg',
      'product 10',
      500000,
    ),
    Product(
      '11',
      'assets/img/product_1.jpg',
      'product 11',
      500000,
    ),
    Product(
      '12',
      'assets/img/product_2.jpg',
      'product 12',
      500000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    WindowType windowType = getWindowType(MediaQuery.of(context).size.width);

    var axisCount = 3;
    switch (windowType) {
      case WindowType.large:
        axisCount = 4;
        break;
      case WindowType.medium:
        axisCount = 3;
        break;
      case WindowType.small:
        axisCount = 2;
        break;
    }

    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.count(
        crossAxisCount: axisCount,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 9 / 13,
        children: productList.map((product) {
          return ProductTile(product: product);
        }).toList(),
      ),
    );
  }
}
