import 'package:flutter/material.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/db/user_crud.dart';
import 'package:powerup/models/exercise_model.dart';
import 'package:powerup/models/user_modal.dart';
import 'package:powerup/screens/reportpage.dart';
import 'package:powerup/screens/screen_splash.dart';
import 'package:powerup/screens/widgets/bottomnav.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  String? selectedGender; // Store the selected gender
  String? selectedLevel;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'USER INFO',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/778785C9-1883-4329-B2FF-660B4F51C49B_1_105_c.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter A Valid Name';
                      } else {
                        return null;
                      }
                    }),

                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter A Valid Age';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                // Gender radio buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          activeColor: Colors.white,
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        const Text('Male',
                            style: TextStyle(color: Colors.white)),
                        Radio<String>(
                          activeColor: Colors.white,
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        const Text('Female',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Level',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Radio<String>(
                          activeColor: Colors.white,
                          value: 'Beginner',
                          groupValue: selectedLevel,
                          onChanged: (value) {
                            setState(() {
                              selectedLevel = value;
                            });
                          },
                        ),
                        Text('Beginner',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.038)),
                        Radio<String>(
                          activeColor: Colors.white,
                          value: 'Intermediate',
                          groupValue: selectedLevel,
                          onChanged: (value) {
                            setState(() {
                              selectedLevel = value;
                            });
                          },
                        ),
                        Text('Intermediate',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.038)),
                        Radio<String>(
                          activeColor: Colors.white,
                          value: 'Advanced',
                          groupValue: selectedLevel,
                          onChanged: (value) {
                            setState(() {
                              selectedLevel = value;
                            });
                          },
                        ),
                        Text('Advanced',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.038)),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedGender == 'Male' &&
                          selectedLevel == 'Beginner') {
                        getWorkouts(Gender.men, Levels.beginner);
                        levelWorkOut = 'BEGINNER';
                      } else if (selectedGender == 'Male' &&
                          selectedLevel == 'Intermediate') {
                        getWorkouts(Gender.men, Levels.intermediate);
                        levelWorkOut = 'INTERMEDIATE';
                      } else if (selectedGender == 'Male' &&
                          selectedLevel == 'Advanced') {
                        getWorkouts(Gender.men, Levels.advanced);
                        levelWorkOut = 'ADVANCED';
                      } else if (selectedGender == 'Female' &&
                          selectedLevel == 'Beginner') {
                        getWorkouts(Gender.women, Levels.beginner);
                        levelWorkOut = 'BEGINNER';
                      } else if (selectedLevel == 'Intermediate') {
                        getWorkouts(Gender.women, Levels.intermediate);
                        levelWorkOut = 'INTERMEDIATE';
                      } else {
                        getWorkouts(Gender.women, Levels.advanced);
                        levelWorkOut = 'ADVANCED';
                      }
                     
                      final userModal = UserModal(
                          name: nameController.text,
                          age: ageController.text,
                          gender: selectedGender!,
                          level: selectedLevel!);
                          addUser(userModal);
                      levelDisplay=userModal.level.toUpperCase();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavBar(),
                          ),
                          (route) => false);
                          getProgress();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
