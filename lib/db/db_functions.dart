import 'package:hive_flutter/hive_flutter.dart';
import 'package:powerup/constants/lists_of_workouts/list_of_advanced_women.dart';
import 'package:powerup/constants/lists_of_workouts/list_of_advancedmen.dart';
import 'package:powerup/constants/lists_of_workouts/list_of_beginner_women.dart';
import 'package:powerup/constants/lists_of_workouts/list_of_inter_women.dart';
import 'package:powerup/constants/lists_of_workouts/list_of_intermen.dart';
import 'package:powerup/constants/lists_of_workouts/lists_of_beginnermen.dart';
import 'package:powerup/models/exercise_model.dart';
import 'package:powerup/screens/reportpage.dart';
 
String dbName = 'workout_db';

initialAddWorkout() async {
  final db = await Hive.openBox<ExerciseModal>(dbName);
  print(db.values.length);
  if (db.isEmpty) {
    // To Add Men Beginner
    for (int i = 0; i < 11; i++) {
      int rep = 0;
      Duration time = Duration.zero;
      if (repetitions[i].contains('x')) {
        rep = int.parse(repetitions[i].split(' ').last);
      } else {
        time = Duration(seconds: int.parse(repetitions[i]));
      }
      final modal = ExerciseModal(
        gender: Gender.men,
          name: exercises[i],
          description: description[i],
          animation: animation[i],
          level: Levels.beginner,
          reps: rep,
          timer: time);
      await db.add(modal);
    }
    // To Add Men Intermediate

    for (int i = 0; i < 13; i++) {
      int rep = 0;
      Duration time = Duration.zero;
      if (intermenRep[i].contains('x')) {
        rep = int.parse(intermenRep[i].split(' ').last);
      } else {
        time = Duration(
          seconds: int.parse(intermenRep[i]),
        );
      }
      final modal = ExerciseModal(
        gender: Gender.men,
          name: intermenExercise[i],
          description: intermenDescription[i],
          animation: intermenAnimation[i],
          level: Levels.intermediate,
          reps: rep,
          timer: time);
      await db.add(modal);
    }

    // To Add Advanced Men

    for (int i = 0; i < 16; i++) {
      int rep = 0;
      Duration time = Duration.zero;
      if (advancemenRep[i].contains('x')) {
        rep = int.parse(advancemenRep[i].split(' ').last);
      } else {
        time = Duration(seconds: int.parse(advancemenRep[i]),);
      }
      final modal = ExerciseModal(
        gender: Gender.men,
          name: advancemenExercise[i],
          description: advancemenDescription[i],
          animation: advancemenAnimation[i],
          level: Levels.advanced,
          reps: rep,
          timer: time);
      await db.add(modal);
    }

    // To Add Women Beginner

    for (int i = 0; i < 12; i++) {
      int rep = 0;
      Duration time = Duration.zero;
      if (beginnerWomenReps[i].contains('x')) {
        rep = int.parse(beginnerWomenReps[i].split(' ').last);
      } else {
        time = Duration(seconds: int.parse(beginnerWomenReps[i]));
      }
      final modal = ExerciseModal(
        gender: Gender.women,
          name: beginnerWomenExercise[i],
          description: beginnerWomenDescription[i],
          animation: beginnerWomenAnimation[i],
          level: Levels.beginner,
          reps: rep,
          timer: time);
      await db.add(modal);
    }

    // To Add Women Intermediate
    for (int i = 0; i < 14; i++) {
      int rep = 0;
      Duration time = Duration.zero;
      if (intermediateWomenReps[i].contains('x')) {
        rep = int.parse(intermediateWomenReps[i].split(' ').last);
      } else {
        time = Duration(seconds: int.parse(intermediateWomenReps[i]));
      }
      final modal = ExerciseModal(
         gender: Gender.women,
          name: intermediateWomenExercise[i],
          description: intermediateWomenDescription[i],
          animation: intermediateWomenAnimation[i],
          level: Levels.intermediate,
          reps: rep,
          timer: time);
      await db.add(modal);
    }

    // To Add Women Advanced

    for (int i = 0; i < 16; i++) {
      int rep = 0;
      Duration time = Duration.zero;
      if (advancedWomenReps[i].contains('x')) {
        rep = int.parse(advancedWomenReps[i].split(' ').last);
      } else {
        time = Duration(seconds: int.parse(advancedWomenReps[i]));
      }
      final modal = ExerciseModal(
         gender: Gender.women,
          name: advancedWomenExercise[i],
          description: advancedWomenDescription[i],
          animation: advancedWomenAnimation[i],
          level: Levels.advanced,
          reps: rep,
          timer: time);
      await db.add(modal);
    }
  }
  getProgress();
}
