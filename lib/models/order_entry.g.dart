// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntry _$OrderEntryFromJson(Map<String, dynamic> json) {
  return OrderEntry(
    Product.fromJson(json['product'] as Map<String, dynamic>),
    json['quality'] as int,
  );
}

Map<String, dynamic> _$OrderEntryToJson(OrderEntry instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'quality': instance.quality,
    };
