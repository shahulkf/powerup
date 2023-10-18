
import 'package:hive_flutter/hive_flutter.dart';
part 'user_modal.g.dart';

@HiveType(typeId: 5)
class UserModal {
  @HiveField(0)
  String name;

  @HiveField(1)
  String age;

  @HiveField(2)
  String gender;

  @HiveField(3)
  String level;

  UserModal(
      {required this.name,
      required this.age,
      required this.gender,
      required this.level,
      });
}
