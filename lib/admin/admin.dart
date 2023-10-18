import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powerup/admin/add_workout.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/screens/screen_category.dart';
import 'package:powerup/screens/workout_show/workout_show.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    filteredWorkouts(selectedGender, selectedLevel);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'ADMIN',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddWorkout(),
                        ));
                  },
                  icon: const Icon(
                    CupertinoIcons.add_circled_solid,
                    size: 30,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Are You Sure Want Log Out ?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const CategoryPage(),
                                        ),
                                        (route) => false);
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.logout_outlined)),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black,
            child: ListView.builder(
              itemCount: gender.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return OnTapBox(index: index, list: gender, width: 180);
              },
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black,
            child: ListView.builder(
              itemCount: level.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return OnTapBox(index: index, list: level, width: 114);
              },
            ),
          ),
          gap10,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.744,
            child: ValueListenableBuilder(
                valueListenable: workoutNotifier,
                builder: (context, workouts, _) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(workouts[index].name),
                            subtitle: Text(
                                "${workouts[index].level.name},${workouts[index].gender.name}"),
                            trailing: SizedBox(
                              height: 50,
                              width: 96,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AddWorkout(
                                                  modal: workouts[index]),
                                            ));
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Are You Sure Want To Delete'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        deleteWorkout(
                                                            workouts[index]
                                                                .name);
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
                            ));
                      },
                      separatorBuilder: (context, index) => gap10,
                      itemCount: workouts.length);
                }),
          )
        ],
      ),
    );
  }
}

class OnTapBox extends StatefulWidget {
  const OnTapBox(
      {super.key,
      required this.index,
      required this.list,
      required this.width});
  final int index;
  final List list;
  final double width;

  @override
  State<OnTapBox> createState() => _OnTapBoxState();
}

class _OnTapBoxState extends State<OnTapBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          bool isLevel = widget.list == level ? true : false;
          if (isLevel) {
            if (isSelected) {
              selectedLevel.remove(level[widget.index].toLowerCase());
            } else {
              selectedLevel.add(level[widget.index].toLowerCase());
            }
          } else {
            if (isSelected) {
              selectedGender.remove(gender[widget.index].toLowerCase());
            } else {
              selectedGender.add(gender[widget.index].toLowerCase());
            }
          }
          setState(() {
            isSelected = !isSelected;
          });
          filteredWorkouts(selectedGender, selectedLevel);
        },
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.grey[800],
              borderRadius: BorderRadius.circular(10)),
          width: widget.width,
          child: Center(
              child: Text(
            widget.list[widget.index],
            style: TextStyle(color: isSelected ? Colors.black : Colors.white),
          )),
        ),
      ),
    );
  }
}

List<String> level = ["Beginner", "Intermediate", "Advanced"];
List<String> gender = ["Men", "Women"];

List<String> selectedLevel = [];
List<String> selectedGender = [];
