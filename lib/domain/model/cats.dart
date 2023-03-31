import 'package:json_annotation/json_annotation.dart';
part 'cats.g.dart';

@JsonSerializable()
class Cats {
  String? sId;
  String? user;
  String? text;
  int? iV;
  String? source;
  String? updatedAt;
  String? type;
  String? createdAt;
  bool? deleted;
  bool? used;

  Cats(
      {this.sId,
      this.user,
      this.text,
      this.iV,
      this.source,
      this.updatedAt,
      this.type,
      this.createdAt,
      this.deleted,
      this.used});

  factory Cats.fromJson(Map<String, dynamic> json) => _$CatsFromJson(json);

  Map<String, dynamic> toJson() => _$CatsToJson(this);
}
