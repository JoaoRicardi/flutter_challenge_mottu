// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pref.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPrefAdapter extends TypeAdapter<UserPref> {
  @override
  final int typeId = 0;

  @override
  UserPref read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPref(
      prefDesc: fields[0] as String,
      createdAt: fields[1] as String,
      updatedAt: fields[2] as String,
      status: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserPref obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.prefDesc)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPrefAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
