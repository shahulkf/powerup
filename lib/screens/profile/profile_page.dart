import 'package:flutter/material.dart';
import 'package:powerup/db/db_crud.dart';
import 'package:powerup/db/user_crud.dart';
import 'package:powerup/models/user_modal.dart';
import 'package:powerup/screens/screen_category.dart';
import 'package:powerup/screens/workout_show/workout_show.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

 final  nameController = TextEditingController();
 final ageController = TextEditingController();
 final genderController = TextEditingController();
 final levelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
       
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'USER PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: (){
            editUserprofile(context); 
           
          }, icon: const Icon(Icons.edit)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset('assets/images/userinfopic.jpg'),
            ),
            gap10,
            ValueListenableBuilder(
              valueListenable: user,
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.grey[900],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Name : ${user.value?.name ?? ''}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    gap10,
                    gap10,
                    Row(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[900]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Age : ${user.value?.age ?? ''}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[900]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Gender : ${user.value?.gender ?? ''}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    gap10,
                    gap10,
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[900]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Level: ${user.value?.level ?? ''}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
  
  void editUserprofile(BuildContext context) {
    nameController.text=user.value!.name;
    ageController.text =user.value!.age;
    genderController.text = user.value!.gender;
    levelController.text = user.value!.level;
     showDialog(context: context, builder: (context) {
              return SingleChildScrollView(
                child: AlertDialog(
                  title: const Text('EDIT USER PROFILE'),
                  actions: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name:'),
                      
                    ),
                    gap10,
              
                    TextFormField(
                      controller: ageController,
                       decoration: const InputDecoration(labelText: 'Age :'),
                      
              
                    ),
                    gap10,
              
                    TextFormField(
                      controller: genderController,
                       decoration: const InputDecoration(labelText: 'Gender :'),
              
                    ),
                    gap10,
                    
                    TextFormField(
                      controller: levelController,
                       decoration: const InputDecoration(labelText: 'Level :'),
              
                    ),
                    gap10,
                    gap10,
                    gap10,
                    Center(
                      child: ElevatedButton(
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                        onPressed: (){
                          if(nameController.text.isNotEmpty && ageController.text.isNotEmpty && genderController.text.isNotEmpty && levelController.text.isNotEmpty){
                            final UserModal userModal = UserModal(name: nameController.text, age: ageController.text, gender: genderController.text, level: levelController.text);
                            updateUser(userModal);
                            Navigator.pop(context);

                          }
                        }, child: const Text('Save',style: TextStyle(color: Colors.black,),)),
                    )
              
                  ],
              
                ),
              );
            },);
  }
}
