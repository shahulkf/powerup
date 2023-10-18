import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/models/exercise_model.dart';
import 'package:powerup/screens/workout_show/workout_show.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({Key? key, this.modal}) : super(key: key);
  final ExerciseModal? modal;
  @override
  AddWorkoutState createState() => AddWorkoutState();
}

class AddWorkoutState extends State<AddWorkout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedWorkoutType = ''; // Default selection
  String slectedGender = '';
  String selectedDuration = '';
  String? image;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final durationController = TextEditingController();
  @override
  void initState() {
    if (widget.modal != null) {
      nameController.text = widget.modal!.name;
      descriptionController.text = widget.modal!.description;
      setState(() {
        selectedWorkoutType = widget.modal!.level.name;
        slectedGender = widget.modal!.gender.name;
      });

      durationController.text = widget.modal!.reps.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.modal!=null){
    image = widget.modal!.animation;

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modal == null ? 'ADD WORKOUT' : 'UPDATE WORKOUT'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              gap10,
              InkWell(
                onTap: () async {
                  String img = await imagePicker();
                  setState(() {
                    image = img;
                  });
                },
                child: Container(
                  height: 200,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: image != null
                        ? image!.contains("assets")?DecorationImage(image: AssetImage(image!)) :DecorationImage(image: FileImage(File(image!)))
                        : const DecorationImage(
                            image: NetworkImage(
                                "https://static.vecteezy.com/system/resources/thumbnails/001/500/603/small/add-icon-free-vector.jpg")),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'workout name is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Workout Name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'description is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Workout Description',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Select Workout Level :'),
              RadioListTile(
                title: const Text('Beginner'),
                value: 'Beginner',
                groupValue: selectedWorkoutType,
                onChanged: (value) {
                  setState(() {
                    selectedWorkoutType = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text('Intermediate'),
                value: 'Intermediate',
                groupValue: selectedWorkoutType,
                onChanged: (value) {
                  setState(() {
                    selectedWorkoutType = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text('Advanced'),
                value: 'Advanced',
                groupValue: selectedWorkoutType,
                onChanged: (value) {
                  setState(() {
                    selectedWorkoutType = value.toString();
                  });
                },
              ),
              const Text('Select Gender :'),
              gap10,
              RadioListTile(
                title: const Text('Men'),
                value: 'men',
                groupValue: slectedGender,
                onChanged: (value) {
                  setState(() {
                    slectedGender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text('women'),
                value: 'women',
                groupValue: slectedGender,
                onChanged: (value) {
                  setState(() {
                    slectedGender = value.toString();
                  });
                },
              ),
              // Add more workout types as needed
              gap10,
              const Text('Select Duration :'),
              gap10,

              TextFormField(
                controller: durationController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Duration',
                    labelText: 'Duration',
                    border: const OutlineInputBorder(),
                    suffix: SizedBox(
                      height: 20,
                      width: 260,
                      child: Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                                title: const Text('Reps'),
                                value: 'Reps',
                                groupValue: selectedDuration,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDuration = value.toString();
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: const Text('Time'),
                                value: 'Time',
                                groupValue: selectedDuration,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDuration = value.toString();
                                  });
                                }),
                          ),
                        ],
                      ),
                    )),
              ),
              gap10,
              gap10,

              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedWorkoutType.isEmpty ||
                          selectedDuration.isEmpty ||
                          slectedGender.isEmpty) {
                        return;
                      } else {
                        ExerciseModal exerciseModal = ExerciseModal(
                            name: nameController.text,
                            description: descriptionController.text,
                            animation: image!,
                            level: getLevel(selectedWorkoutType),
                            gender: getGender(slectedGender),
                            reps: getRepsOrTimer(
                                durationController.text, selectedDuration));
                        if (widget.modal != null) {
                          editWorkout(exerciseModal,widget.modal!.name);
                        } else {
                          addWorkoutIntoDb(exerciseModal);
                        }

                        Navigator.pop(context);
                      }
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> imagePicker() async {
  // print("HEllo");
  final image = await ImagePicker().pickImage(source: ImageSource.camera);
  if (image == null) {
    return '';
  }
  return image.path;
}

Levels getLevel(String level) {
  if (level.toLowerCase() == Levels.values[0].name.toLowerCase()) {
    return Levels.values[0];
  } else if (level.toLowerCase() == Levels.values[1].name.toLowerCase()) {
    return Levels.values[1];
  } else {
    return Levels.values[2];
  }
}

Gender getGender(String gender) {
  if (gender == Gender.values[0].name) {
    return Gender.values[0];
  } else {
    return Gender.values[1];
  }
}

int getRepsOrTimer(String duration, String type) {
  if (type == 'Reps') {
    return int.parse(duration);
  } else {
    return 0;
  }
}
