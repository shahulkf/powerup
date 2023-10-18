import 'package:hive/hive.dart';
part 'exercise_model.g.dart';

@HiveType(typeId: 0)
class ExerciseModal {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  String animation;

  @HiveField(3)
  Levels level;

  @HiveField(4)
  Duration? timer;

  @HiveField(5)
  int? reps;

  @HiveField(6)
  Gender gender;

  @HiveField(7)
  bool isCompleted;

  ExerciseModal(
      {required this.name,
      required this.description,
      required this.animation,
      required this.level,
      required this.gender,
      this.timer = Duration.zero,
      this.reps = 0,
      this.isCompleted = false});
}

enum Levels { beginner, intermediate, advanced }

enum Gender { men, women }

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 1; // Use a unique typeId

  @override
  Gender read(BinaryReader reader) {
    return Gender.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    writer.writeByte(obj.index);
  }
}

class LevelsAdapter extends TypeAdapter<Levels> {
  @override
  final int typeId = 2; // Use a unique typeId

  @override
  Levels read(BinaryReader reader) {
    return Levels.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, Levels obj) {
    writer.writeByte(obj.index);
  }
}

class DurationAdapter extends TypeAdapter<Duration> {
  @override
  final int typeId = 3; // Use a unique typeId

  @override
  Duration read(BinaryReader reader) {
    final millis = reader.readInt32();
    return Duration(milliseconds: millis);
  }

  @override
  void write(BinaryWriter writer, Duration obj) {
    writer.writeInt32(obj.inMilliseconds);
  }
}
