import 'dart:io';

import 'package:flutter/material.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/db/db_workout_completion.dart';
import 'package:powerup/db/user_crud.dart';
import 'package:powerup/screens/reportpage.dart';
import 'package:powerup/utils/timer.dart';

class WorkoutShowScreen extends StatefulWidget {
  final String title;
  final String timer;
  final String description;
  final String animation;
  final String? level;

  const WorkoutShowScreen(
      {super.key,
      required this.title,
      required this.timer,
      required this.description,
      required this.animation,
      this.level});

  @override
  State<WorkoutShowScreen> createState() => _WorkoutShowScreenState();
}

class _WorkoutShowScreenState extends State<WorkoutShowScreen> {
  @override
  void initState() {
    super.initState();
    isTimerEnd.value = false;
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(245, 255, 255, 255),
                  image: widget.animation.contains('assets')
                      ? DecorationImage(image: AssetImage(widget.animation))
                      : DecorationImage(
                          image: FileImage(File(widget.animation)))),
            ),
            gap10,
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            gap10,
            Text(widget.description),
            user.value == null
                ? const SizedBox()
                : widget.timer.contains('x')
                    ? Center(
                        child: Text(
                        widget.timer,
                        style: const TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ))
                    : StopWatch(
                        count: int.tryParse(widget.timer.substring(0, 2)) ?? 0,
                      ),
            gap10,
            user.value == null
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ValueListenableBuilder(
                        valueListenable: isTimerEnd,
                        builder: (context, value, _) {
                          return Visibility(
                            visible: value
                                ? value
                                : widget.timer.contains('x')
                                    ? true
                                    : false,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                updateCompletion(widget.title);
                                getProgress();
                                workoutNotifier.notifyListeners();
                              },
                              child: Container(
                                height: 50,
                                width: 380,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text("Completed"),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}

const gap10 = SizedBox(
  height: 10,
);
