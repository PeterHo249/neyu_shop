import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  Product(
    this.id,
    this.imageUrl,
    this.name,
    this.price,
  );

  String id;
  @JsonKey(defaultValue: "")
  String imageUrl;
  String name;
  @JsonKey(defaultValue: 0.0)
  double price;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
