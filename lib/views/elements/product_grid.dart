import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:neyu_shop/views/elements/loading_indicator.dart';
import 'package:neyu_shop/views/elements/product_tile.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DataProvider.instance.getProductList(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return SliverToBoxAdapter(
            child: LoadingIndicator(),
          );
        }

        List<Product> products = snapshot.data!.docs
            .map(
              (docSnapshot) => Product.fromJson(
                json.decode(
                  json.encode(
                    docSnapshot.data(),
                  ),
                ),
              ),
            )
            .toList();

        return buildProductGrid(context, products);
      },
    );
  }

  Widget buildProductGrid(BuildContext context, List<Product> products) {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.count(
        crossAxisCount: getTileCountOnRow(context),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 9 / 13,
        children: products.map((product) {
          return ProductTile(product: product);
        }).toList(),
      ),
    );
  }
}
