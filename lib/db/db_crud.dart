import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:powerup/db/db_functions.dart';
import 'package:powerup/models/exercise_model.dart';

ValueNotifier<List<ExerciseModal>> workoutNotifier = ValueNotifier([]);

Future getWorkouts(Gender gender, Levels level) async {
  final db = await Hive.openBox<ExerciseModal>(dbName);
  final list = db.values;
  workoutNotifier.value.clear();
  for (var element in list) {
    if (element.gender == gender && element.level == level) {
      workoutNotifier.value.add(element);
    }
  }
  print(list.length);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  workoutNotifier.notifyListeners();
}

getAllWorkouts() async {
  final db = await Hive.openBox<ExerciseModal>(dbName);
  workoutNotifier.value.clear();
  workoutNotifier.value.addAll(db.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  workoutNotifier.notifyListeners();
}

filteredWorkouts(List<String> gender, List<String> levels) async {
  final db = await Hive.openBox<ExerciseModal>(dbName);
  final allWorkouts = db.values.toList();

  workoutNotifier.value.clear();

  if (gender.isEmpty && levels.isEmpty) {
    workoutNotifier.value.addAll(allWorkouts);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    workoutNotifier.notifyListeners();
  } else if (gender.isEmpty && levels.isNotEmpty) {
    final List<ExerciseModal> result = allWorkouts
        .where((workout) => levels.contains(workout.level.name))
        .toList();
    workoutNotifier.value = result;
  } else if (gender.isNotEmpty && levels.isEmpty) {
    final List<ExerciseModal> result = allWorkouts
        .where((workout) => gender.contains(workout.gender.name))
        .toList();
    workoutNotifier.value = result;
  } else {
    final List<ExerciseModal> result = allWorkouts
        .where((workout) =>
            gender.contains(workout.gender.name) &&
            levels.contains(workout.level.name))
        .toList();
    workoutNotifier.value = result;
  }
}

addWorkoutIntoDb(ExerciseModal exerciseModal) async {
  final db = await Hive.openBox<ExerciseModal>(dbName);
  db.add(exerciseModal);
  getAllWorkouts();
}

editWorkout(ExerciseModal exerciseModal, String workoutName) async {
  final db = await Hive.openBox<ExerciseModal>(dbName);
  final index = db.values.toList().indexWhere((workout) =>
      workout.name == workoutName && exerciseModal.gender == workout.gender);
  if (index != -1) {
    db.putAt(index, exerciseModal);
    getAllWorkouts();
  }
}

deleteWorkout(String workoutName) async {
  final db = await Hive.openBox<ExerciseModal>(dbName);
  final index =
      db.values.toList().indexWhere((workout) => workout.name == workoutName);
  db.deleteAt(index);
  getAllWorkouts();
  print("deleted successfully");
}
