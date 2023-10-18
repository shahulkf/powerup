import 'package:flutter/material.dart';
import 'package:powerup/screens/workout_show/workout_show.dart';

class ExerciseListItem extends StatelessWidget {
  final String title;
  final String trailing;
  final String description;
  final String animation;
  final bool completed;

  const ExerciseListItem(
      {super.key,
      required this.title,
      required this.trailing,
      required this.description,
      required this.animation,required
      this.completed,
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      leading: completed?const Icon(Icons.check_circle_outline,color: Colors.green,):null,
      title: Text(title),
      trailing: Text(trailing),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WorkoutShowScreen(
            title: title,
            timer: trailing,
            description: description,
            animation: animation,
          
          ),
        ));
      },
    );
  }
}
