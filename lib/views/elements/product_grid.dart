import 'package:flutter/material.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:neyu_shop/views/elements/product_tile.dart';

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
    WindowType windowType = getWindowType(MediaQuery.of(context).size.width);

    var axisCount = 3;
    switch (windowType) {
      case WindowType.large:
        axisCount = 5;
        break;
      case WindowType.medium:
        axisCount = 4;
        break;
      case WindowType.small:
        axisCount = 3;
        break;
    }

    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.count(
        crossAxisCount: axisCount,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: productList.map((product) {
          return ProductTile(product: product);
        }).toList(),
      ),
    );
  }
}
