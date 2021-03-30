import 'package:json_annotation/json_annotation.dart';
import 'package:neyu_shop/models/address.dart';
part 'customer.g.dart';

@JsonSerializable(explicitToJson: true)
class Customer {
  Customer(
    this.phoneNumber,
    this.name,
    this.address,
  );

  @JsonKey(defaultValue: "")
  String phoneNumber;
  String name;
  Address address;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
