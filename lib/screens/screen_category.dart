import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:powerup/admin/admin_login.dart';
import 'package:powerup/screens/category/screen_men_category.dart';
import 'package:powerup/screens/screen_userinfo.dart';
import 'package:powerup/screens/category/screen_womencategory.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'CATEGORY',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [

          // IconButton(
          //   icon: Icon(Icons.abc),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const NavBar()),
          //     );
          //   },
          // ),
         
          GestureDetector(
         onLongPress:  () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminLogin ()) );
            },
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserInfo(),
                ),
              );
            },
            child: const Icon(
                Icons.account_circle,
                size: 30,
              ),
          ),
          SizedBox(width: 10,)
        ],
        centerTitle: true, 
      ),
      // body: Center(
      //   child: Text('CATEGORY SCREEN'),
      // ), 
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.44,
                  child: Image.asset(
                    'assets/images/for_men.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    log('Him clicked');
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MenLevel()),
                    );
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Text(
                    'FOR HIM',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.44,
                  child: Image.asset(
                    'assets/images/her_work_intrme.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    log('Her clicked');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WomenLevel()));
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text(
                    'FOR HER',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
