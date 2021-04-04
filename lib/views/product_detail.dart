import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:neyu_shop/views/elements/add_to_cart_button.dart';
import 'package:neyu_shop/views/elements/amount_picker.dart';
import 'package:neyu_shop/views/elements/information_footer.dart';
import 'package:neyu_shop/views/elements/main_app_bar.dart';

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
            maxLines: widgetWidth - 100 > 300 ? 15 : 7,
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
}
