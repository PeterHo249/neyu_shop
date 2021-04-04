import 'package:flutter/material.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:neyu_shop/views/elements/product_tile.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.count(
        crossAxisCount: getTileCountOnRow(context),
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
