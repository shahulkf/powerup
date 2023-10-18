import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:powerup/db/db_functions.dart';
import 'package:powerup/models/exercise_model.dart';
import 'package:powerup/models/user_modal.dart';
import 'package:powerup/screens/screen_splash.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ExerciseModalAdapter().typeId)) {
    Hive.registerAdapter(ExerciseModalAdapter());
  }
  if (!Hive.isAdapterRegistered(LevelsAdapter().typeId)) {
    Hive.registerAdapter(LevelsAdapter());
  }
  if (!Hive.isAdapterRegistered(GenderAdapter().typeId)) {
    Hive.registerAdapter(GenderAdapter());
  }
  if (!Hive.isAdapterRegistered(DurationAdapter().typeId)) {
    Hive.registerAdapter(DurationAdapter());
  }
  if (!Hive.isAdapterRegistered(UserModalAdapter().typeId)) {
    Hive.registerAdapter(UserModalAdapter());
  }
  // getAllWorkouts();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initialAddWorkout();
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const ScreenSplash(),
    );
  }
}
