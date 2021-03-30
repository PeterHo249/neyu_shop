import 'package:json_annotation/json_annotation.dart';
import 'package:neyu_shop/models/product.dart';
part 'order_entry.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderEntry {
  OrderEntry(
    this.product,
    this.quality,
  );

  Product product;
  int quality;

  factory OrderEntry.fromJson(Map<String, dynamic> json) =>
      _$OrderEntryFromJson(json);
  Map<String, dynamic> toJson() => _$OrderEntryToJson(this);
}
