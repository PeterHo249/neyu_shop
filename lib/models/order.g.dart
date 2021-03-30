// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    json['id'] as String,
    Customer.fromJson(json['customer'] as Map<String, dynamic>),
    (json['entries'] as List<dynamic>)
        .map((e) => OrderEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['totalValue'] as num).toDouble(),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer.toJson(),
      'entries': instance.entries.map((e) => e.toJson()).toList(),
      'totalValue': instance.totalValue,
    };
