// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogpost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blogpost _$BlogpostFromJson(Map<String, dynamic> json) {
  return Blogpost(
    json['title'] as String,
    json['content'] as String,
  );
}

Map<String, dynamic> _$BlogpostToJson(Blogpost instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };
