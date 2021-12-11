import 'package:fantastic_five_name_game/Data/User_Model.dart';
import 'package:fantastic_five_name_game/Utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hub_page.dart';

class add_new_user extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: addNewUser(),
   );
  }
}

class addNewUser extends StatefulWidget{
  addNewUserState createState() => addNewUserState();
}

class addNewUserState extends State<addNewUser> {
  User? user = FirebaseAuth.instance.currentUser;
  late String uid;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    uid = user!.uid;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Fill out your profile"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),

              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                    hintText: 'Enter your first name'),
                controller: firstNameController,
                keyboardType: TextInputType.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                    hintText: 'Enter your last name'),
                    controller: lastNameController,
                    keyboardType: TextInputType.name,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number',
                    hintText: 'Please enter your phone number'),
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20)
            ),


            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: (){
                  UserModel userModel = UserModel(firstNameController.text, lastNameController.text,
                  phoneNumberController.text, 0, 0);
                  firestore.collection('users').doc(uid).set(userModel.toMap());




                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return Hub();
                  }));
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}