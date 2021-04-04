import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/views/elements/FadePageRoute.dart';
import 'package:neyu_shop/views/elements/add_to_cart_button.dart';
import 'package:neyu_shop/views/product_detail.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({required this.product});

  final Product product;

  @override
  _ProductTileState createState() => _ProductTileState(product);
}

class _ProductTileState extends State<ProductTile> {
  _ProductTileState(this.product);

  Product product;

  @override
  Widget build(BuildContext context) {
    var priceString = FlutterMoneyFormatter(
      amount: product.price,
      settings: MoneyFormatterSettings(
        thousandSeparator: '.',
        decimalSeparator: ',',
      ),
    ).output.withoutFractionDigits;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          FadePageRoute(
            ProductDetailPage(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var imageSize = constraints.maxWidth * 0.65;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imageUrl,
                    height: imageSize,
                    width: imageSize,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: constraints.maxWidth,
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: constraints.maxWidth,
                  child: Text(
                    '$priceString',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.amber[700],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                AddToCartButton(
                  action: () {
                    print("Add to cart button pressed");
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
