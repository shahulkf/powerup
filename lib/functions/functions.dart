import 'package:flutter/material.dart';
import 'package:powerup/screens/screen_getstarted.dart';

void start(BuildContext context)  {
  
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const GetStarted(),
    ),
  );
}



