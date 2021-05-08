import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:neyu_shop/views/elements/add_to_cart_button.dart';
import 'package:neyu_shop/views/elements/amount_picker.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';
import 'package:neyu_shop/views/elements/product_tile.dart';

import 'elements/loading_indicator.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildProductDetailPageContent(context),
    );
  }

  Widget _buildProductDetailPageContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MainAppBar(),
        _buildProductDetailContent(context),
        ..._buildOtherProductPane(context),
        InformationFooter(),
      ],
    );
  }

  Widget _buildProductDetailContent(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount:
          getWindowType(MediaQuery.of(context).size.width) != WindowType.large
              ? 1
              : 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: [
        Hero(
          tag: product.id,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        _buildProductDescriptionPane(context),
      ],
    );
  }

  Widget _buildProductDescriptionPane(BuildContext context) {
    var widgetWidth =
        getWindowType(MediaQuery.of(context).size.width) != WindowType.large
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * 0.5;
    var priceString = FlutterMoneyFormatter(
      amount: product.price,
      settings: MoneyFormatterSettings(
        thousandSeparator: '.',
        decimalSeparator: ',',
        fractionDigits: 0,
        symbol: 'VND',
      ),
    ).output.symbolOnRight;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: widgetWidth,
          child: Text(
            product.name,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            '$priceString',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w200,
              color: Colors.amber[700],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        Container(
          width: widgetWidth,
          child: Text(
            product.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
            maxLines: widgetWidth - 100 > 300 ? 10 : 7,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildAddToCartRow(context),
      ],
    );
  }

  Widget _buildAddToCartRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: AmountPicker(
              onValueChanged: (value) {
                print('Amount change');
              },
            ),
          ),
          AddToCartButton(
            action: () {
              print('Add to cart button pressed');
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOtherProductPane(BuildContext context) {
    var tileWidth =
        MediaQuery.of(context).size.width / getTileCountOnRow(context);
    return [
      SliverToBoxAdapter(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Other Products',
                style: TextStyle(
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(
                  indent: 50.0,
                  endIndent: 50.0,
                  thickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: tileWidth * 13 / 9 + 20.0,
          child: StreamBuilder(
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

              return buildOtherProductList(context, products, tileWidth);
            },
          ),
        ),
      ),
    ];
  }

  Widget buildOtherProductList(
    BuildContext context,
    List<Product> products,
    double tileWidth,
  ) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: products.map(
        (p) {
          if (p.id == product.id)
            return Container(
              width: 0.0,
              height: tileWidth * 13 / 9,
            );
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ProductTile(product: p),
            width: tileWidth,
            height: tileWidth * 13 / 9,
          );
        },
      ).toList(),
    );
  }
}
