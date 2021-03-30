// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['province'] as String? ?? 'Ho Chi Minh city',
    json['district'] as String,
    json['locatedPart'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'province': instance.province,
      'district': instance.district,
      'locatedPart': instance.locatedPart,
    };
