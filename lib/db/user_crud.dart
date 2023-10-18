import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:powerup/admin/add_workout.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/db/db_functions.dart';
import 'package:powerup/models/exercise_model.dart';
import 'package:powerup/models/user_modal.dart';
import 'package:powerup/screens/reportpage.dart';

const userDbName = 'userDB';
ValueNotifier<UserModal?> user = ValueNotifier(null);
void addUser(UserModal userModal) async {
 final userDb = await Hive.openBox<UserModal>(userDbName);
  await userDb.add(userModal);
  getUser();
}
getUser()async{
  final userDb = await Hive.openBox<UserModal>(userDbName);
  if(userDb.values.isEmpty){
    user.value=null;
    return;
  }
  final users = userDb.values.toList();
  user.value=users[0];
  user.notifyListeners();
}
editWorkoutList(userModal)async{
  final userDb = await Hive.openBox<UserModal>(userDbName);
  userDb.putAt(0, userModal);
  getUser();
}

deleteUserData()async{
  final userDb = await Hive.openBox<UserModal>(userDbName);
   userDb.deleteAt(0);
   final db = await Hive.openBox<ExerciseModal>(dbName);
   for(int i=0; i<db.values.length; i++){
    final value = db.getAt(i);
    value!.isCompleted=false;
    db.putAt(i, value);
    progress.clear();
   }
}


updateUser(UserModal user)async{
  final userDb = await Hive.openBox<UserModal>(userDbName);
  userDb.putAt(0,user);
  getUser();
  getWorkouts(getGender(user.gender=='Male'?'men':'women'), getLevel(user.level));
}