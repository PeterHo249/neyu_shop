import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:neyu_shop/models/customer.dart';
import 'package:neyu_shop/models/order_entry.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/utils/order_status.dart';
part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order extends ChangeNotifier {
  Order(
    this.id,
    this.customer,
    this.entries,
    this.totalValue,
    this.date,
    this.statusString,
  );

  String id;
  Customer customer;
  List<OrderEntry> entries;
  double totalValue;
  DateTime date;
  String statusString;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  OrderStatus get status =>
      OrderStatusEnum.getStatusByTitle(title: statusString);

  double computeCost() {
    double cost = 0;
    if (entries.length != 0) {
      for (int i = 0; i < entries.length; i++) {
        cost += entries[i].computeCost();
      }
    }

    return cost;
  }

  int computeAmount() {
    int amount = 0;

    if (entries.length != 0) {
      for (int i = 0; i < entries.length; i++) {
        amount += entries[i].quality;
      }
    }

    return amount;
  }

  void addItem({required Product product, int amount = 1}) {
    if (amount < 1) {
      return;
    }

    if (entries.length == 0) {
      entries.add(
        OrderEntry(
          product,
          amount,
        ),
      );
    } else {
      var index = entries.indexWhere((item) {
        return item.product.id == product.id;
      });

      if (index != -1) {
        entries[index].addQuality(amount);
      } else {
        entries.add(
          OrderEntry(
            product,
            amount,
          ),
        );
      }
    }

    totalValue = computeCost();

    notifyListeners();
  }

  void changeAmount({required OrderEntry item, int amount = 1}) {
    if (amount < 1) {
      return;
    }

    if (entries.length != 0) {
      var index = entries.indexWhere((testItem) {
        return item.product.id == testItem.product.id;
      });

      if (index != -1) {
        entries[index].quality = amount;
      }
    }

    totalValue = computeCost();

    notifyListeners();
  }

  void removeItem({required OrderEntry item}) {
    if (entries.length > 0) {
      entries.removeWhere((testItem) {
        return item.product.id == testItem.product.id;
      });
    }

    totalValue = computeCost();

    notifyListeners();
  }

  void clearOrder() {
    if (entries.length > 0) {
      entries.clear();
    } else {
      entries = [];
    }

    totalValue = computeCost();

    notifyListeners();
  }
}
