import 'package:json_annotation/json_annotation.dart';
import 'package:neyu_shop/models/customer.dart';
import 'package:neyu_shop/models/order_entry.dart';
part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  Order(
    this.id,
    this.customer,
    this.entries,
    this.totalValue,
  );

  String id;
  Customer customer;
  List<OrderEntry> entries;
  double totalValue;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
