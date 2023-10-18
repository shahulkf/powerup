import 'package:flutter/material.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/models/exercise_model.dart';
import 'package:powerup/screens/workout/work_out.dart';

class MenLevel extends StatelessWidget {
  const MenLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'MEN',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      // body: Center(child: Text('Women Levels')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async{
                await getWorkouts(Gender.men,Levels.beginner);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Workouts(level: 'BEGINNER',),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                  height: MediaQuery.of(context).size.height*0.2949,
                    color: Colors.amber,
                    child: Image.asset(
                      'assets/images/his_work_begin.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    'BEGINNER',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: ()async {
                await getWorkouts(Gender.men, Levels.intermediate);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Workouts(level: 'INTERMEDIATE'),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                   height: MediaQuery.of(context).size.height*0.2949,
                    color: Colors.blue,
                    child: Image.asset(
                      'assets/images/his_intermediate.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                const  Text(
                    'INTERMEDIATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () async{
                await getWorkouts(Gender.men, Levels.advanced);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Workouts(level: 'ADVANCED',)));
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.2949,
                    color: Colors.blueGrey,
                    child: Image.asset(
                      'assets/images/his_work_adv.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    'ADVANCED',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
