import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/order_entry.dart';
import 'package:neyu_shop/views/elements/amount_picker.dart';

class OrderEntryTile extends StatelessWidget {
  const OrderEntryTile({required this.orderEntry});

  final OrderEntry orderEntry;

  @override
  Widget build(BuildContext context) {
    var priceString = FlutterMoneyFormatter(
      amount: orderEntry.product.price,
      settings: MoneyFormatterSettings(
        thousandSeparator: '.',
        decimalSeparator: ',',
      ),
    ).output.withoutFractionDigits;

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          orderEntry.product.imageUrl,
        ),
      ),
      title: Text(orderEntry.product.name),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(priceString),
          AmountPicker(
            initialValue: orderEntry.quality,
            onValueChanged: (value) {
              DataProvider.instance.currentOrder
                  .changeAmount(item: orderEntry, amount: value);
            },
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.cancel_outlined),
        onPressed: () {
          DataProvider.instance.removeItem(item: orderEntry);
        },
      ),
    );
  }
}
