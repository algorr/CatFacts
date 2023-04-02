// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatsAdapter extends TypeAdapter<Cats> {
  @override
  final int typeId = 0;

  @override
  Cats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cats(
      text: fields[0] as String?,
      createdAt: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cats obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cats _$CatsFromJson(Map<String, dynamic> json) => Cats(
      text: json['text'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CatsToJson(Cats instance) => <String, dynamic>{
      'text': instance.text,
      'createdAt': instance.createdAt,
    };
