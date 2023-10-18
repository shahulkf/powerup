
import 'package:flutter/material.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/db/user_crud.dart';
import 'package:powerup/screens/widgets/exercise_list_item.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key, required this.level});
  final String level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.value==null?level:user.value!.level.toUpperCase(),
          style:const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: workoutNotifier,
            builder: (context, workouts, _) {
              return ListView.separated(
                physics:  const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return ExerciseListItem(
                    completed:user.value==null?false:workouts[index].isCompleted,
                    title: workouts[index].name,
                    trailing: workouts[index].timer == Duration.zero
                        ? 'x ${workouts[index].reps}'
                        : "${workouts[index].timer!.inSeconds.toString()} Sec",
                    description: workouts[index].description,
                    animation: workouts[index].animation,
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider(
                    thickness: 3,
                  );
                },
                itemCount: workouts.length,
              );
            }),
      ),
    );
  }
}
