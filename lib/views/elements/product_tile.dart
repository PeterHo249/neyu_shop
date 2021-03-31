import 'package:flutter/material.dart';
import 'package:neyu_shop/models/product.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
