// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cats _$CatsFromJson(Map<String, dynamic> json) => Cats(
      sId: json['sId'] as String?,
      user: json['user'] as String?,
      text: json['text'] as String?,
      iV: json['iV'] as int?,
      source: json['source'] as String?,
      updatedAt: json['updatedAt'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      deleted: json['deleted'] as bool?,
      used: json['used'] as bool?,
    );

Map<String, dynamic> _$CatsToJson(Cats instance) => <String, dynamic>{
      'sId': instance.sId,
      'user': instance.user,
      'text': instance.text,
      'iV': instance.iV,
      'source': instance.source,
      'updatedAt': instance.updatedAt,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'deleted': instance.deleted,
      'used': instance.used,
    };
