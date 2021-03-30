// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    json['phoneNumber'] as String? ?? '',
    json['name'] as String,
    Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'address': instance.address.toJson(),
    };
