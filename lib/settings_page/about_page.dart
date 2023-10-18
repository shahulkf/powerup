// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ABOUT',style: TextStyle(fontWeight: FontWeight.bold),),backgroundColor: Colors.black
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('''About Power Up
                
                Are you ready to transform your fitness journey? Power Up is more than just a workout app; it's your ultimate fitness companion designed to help you achieve your health and fitness goals with ease and enthusiasm.
                
                Our Mission
                
                At Power Up, our mission is to empower individuals of all fitness levels to take control of their health and well-being. We believe that a healthier you leads to a happier you. Whether you're just starting your fitness journey or looking to take it to the next level, we've got you covered.
                Why Choose Power Up?
                
                User-Friendly: Our app is designed to be easy to use, so you can focus on your workouts without any hassle.
                
                Science-Backed: Our workouts and nutrition guidance are based on sound scientific principles.
                
                Motivation: We're here to motivate you every step of the way. Your success is our success.
                
                Convenience: Work out on your terms, whether you're at home, the gym, or on the go.
                
                Get Ready to Power Up!
                
                Join the Power Up community today and take the first step towards a healthier, stronger, and more confident you. It's time to unlock your full potential and become the best version of yourself.
                
                Download Power Up now and let's embark on this journey together!
                
                Feel free to modify and personalize this about section to match the unique aspects and goals of your workout app, "Power Up."
                
                ''')
              ],
            ),
          ),
        ),
      ),
    );
  }
}