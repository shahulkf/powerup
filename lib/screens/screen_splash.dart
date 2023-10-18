// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:powerup/admin/add_workout.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/db/user_crud.dart';
import 'package:powerup/functions/functions.dart';
import 'package:powerup/screens/widgets/bottomnav.dart';
String levelDisplay = '';
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    validate();
  }
  validate()async{
    if(await checkUser()){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>const NavBar() ,), (route) => false);

    }else{
    start(context);

    }
  }
  Future<bool> checkUser()async{
    await getUser();
    if(user.value!=null){
    await Future.delayed(const Duration(seconds: 2));
    if(user.value!.gender.contains('Male')){
      getWorkouts(getGender('men'), getLevel(levelDisplay));
    }else{
      getWorkouts(getGender(user.value!.gender), getLevel(user.value!.level));
    }
    return true;
    }else{
      return false;

    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
            image: AssetImage(
                'assets/images/Screenshot 2023-08-31 at 6.26.12 PM.png')),
      ),
    );
  }
}
