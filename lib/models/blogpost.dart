import 'package:json_annotation/json_annotation.dart';
part 'blogpost.g.dart';

@JsonSerializable(explicitToJson: true)
class Blogpost {
  Blogpost(
    this.title,
    this.content,
  );

  String title;
  String content;

  factory Blogpost.fromJson(Map<String, dynamic> json) =>
      _$BlogpostFromJson(json);
  Map<String, dynamic> toJson() => _$BlogpostToJson(this);
}
