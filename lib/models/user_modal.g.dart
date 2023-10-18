// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModalAdapter extends TypeAdapter<UserModal> {
  @override
  final int typeId = 5;

  @override
  UserModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModal(
      name: fields[0] as String,
      age: fields[1] as String,
      gender: fields[2] as String,
      level: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
