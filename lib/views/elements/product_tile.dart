import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:neyu_shop/models/product.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);

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

    return Container(
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
              Image.network(
                product.imageUrl,
                height: imageSize,
                width: imageSize,
                fit: BoxFit.fill,
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
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    print('add to cart');
                  },
                  child: Text('Add to cart'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(
                        15.0,
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 16.0,
                    )),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.amber[400];
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.amber[60];
                        return Colors.amber;
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
