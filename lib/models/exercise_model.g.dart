// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseModalAdapter extends TypeAdapter<ExerciseModal> {
  @override
  final int typeId = 0;

  @override
  ExerciseModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseModal(
      name: fields[0] as String,
      description: fields[1] as String,
      animation: fields[2] as String,
      level: fields[3] as Levels,
      gender: fields[6] as Gender,
      timer: fields[4] as Duration?,
      reps: fields[5] as int?,
      isCompleted: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseModal obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.animation)
      ..writeByte(3)
      ..write(obj.level)
      ..writeByte(4)
      ..write(obj.timer)
      ..writeByte(5)
      ..write(obj.reps)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
