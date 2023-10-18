

import 'package:hive_flutter/hive_flutter.dart';
import 'package:powerup/db/db_functions.dart';
import 'package:powerup/models/exercise_model.dart';



updateCompletion(String workoutname)async{
  // for open box
 final completionDb=await Hive.openBox<ExerciseModal>(dbName);
 // find data index
 final index = completionDb.values.toList().indexWhere((workout) => workout.name==workoutname);
 // fetch currespond data
 final value = completionDb.getAt(index);
 // change field value as true
 value!.isCompleted=true;
 // update value
 completionDb.putAt(index, value);
}