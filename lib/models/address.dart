import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  Address(
    this.province,
    this.district,
    this.locatedPart,
  );

  @JsonKey(defaultValue: "Ho Chi Minh city")
  String province;
  String district;
  String locatedPart;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
