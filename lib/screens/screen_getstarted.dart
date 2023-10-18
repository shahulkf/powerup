
import 'package:flutter/material.dart';
import 'package:powerup/screens/screen_category.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/HD-wallpaper-gym-motivation-never-give-up-bodybuilder.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    //  log('Button Pressed');
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const CategoryPage(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    'GET STARTED',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              )
            ],
          ),
        ],
      ),
    );
  }
}
