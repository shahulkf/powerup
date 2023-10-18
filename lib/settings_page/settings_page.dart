// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/db/user_crud.dart';
import 'package:powerup/screens/profile/profile_page.dart';
import 'package:powerup/screens/screen_category.dart';
import 'package:powerup/settings_page/about_page.dart';
import 'package:powerup/settings_page/privacy_page.dart';
import 'package:powerup/settings_page/terms_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SETTINGS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          ListTile(
            onTap: (){
               Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ));
            },
            leading: const Icon(Icons.person),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 20),
            ),
            trailing:  Icon(Icons.arrow_forward_ios,size: 20,)),
          const Divider(
            thickness: 3,
          ),
          ListTile(
            onTap: (){
 Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPage(),));
            },
            leading: const Icon(Icons.lock_open_outlined),
            title: const Text(
              'Privacy & Policy',
              style: TextStyle(fontSize: 20),
            ),
            trailing: Icon(Icons.arrow_forward_ios,size: 20,)),
          
          const Divider(
            thickness: 3,
          ),
          ListTile(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsandCondtionsPage(),));
            },
            leading: const Icon(Icons.shield_outlined),
            title: const Text(
              'Terms & Conditons',
              style: TextStyle(fontSize: 20),
            ),
            trailing: Icon(Icons.arrow_forward_ios,size: 20,)),
          
          const Divider(
            thickness: 3,
          ),
          ListTile(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(),));
            },
            leading: const Icon(Icons.help_outline_outlined),
            title: const Text(
              'About',
              style: TextStyle(fontSize: 20),
            ),
            trailing:  Icon(Icons.arrow_forward_ios,size: 20,)),
         
          const Divider(
            thickness: 3,
          ),
          ListTile(
            onTap: () {
               showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Are You Sure Want To Reset Data ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CategoryPage(),
                                  ),
                                  (route) => false,
                                );
                                deleteUserData();
                                getAllWorkouts();
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(color: Colors.red),
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
            leading: const Icon(Icons.restart_alt_rounded,size: 29,),
            title: const Text(
              'Reset Data',
              style: TextStyle(fontSize: 20),
            ),
            trailing:  const Icon(Icons.arrow_forward_ios,size: 20,)),
      
          const Divider(
            thickness: 3,
          ),
        ],
      ),
    );
  }
}
