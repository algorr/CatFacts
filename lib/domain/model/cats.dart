import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cats.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Cats {
  @HiveField(0)
  String? text;

  @HiveField(1)
  String? createdAt;

  Cats({
    this.text,
    this.createdAt,
  });

  factory Cats.fromJson(Map<String, dynamic> json) => _$CatsFromJson(json);

  Map<String, dynamic> toJson() => _$CatsToJson(this);
}
