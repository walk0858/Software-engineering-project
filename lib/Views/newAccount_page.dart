// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hub_page.dart';




class create_account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: createNewUser(),
    );
  }
}


class createNewUser extends StatefulWidget  {



  createNewUserState createState() => createNewUserState();
}

class createNewUserState extends State<createNewUser>{

  String errorMessage = '';
  String password ='';
  String password2 = '';
  String email = '';

  void setErrorMessage(String message){
    setState(() {
      errorMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create new account"),
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
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text){
                  email =text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password'),
                onChanged: (text){
                  password = text;
                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Verify Password',
                    hintText: 'Please retype your password'),
                onChanged: (text){
                  password2 = text;
                },

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
                onPressed: () async {
                  bool success = false;

                  if (password == password2) {
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: email, password: password);
                      success = true;

                    }
                    on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        setErrorMessage('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        setErrorMessage('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                  else {
                    setErrorMessage("Your passwords do not match");
                  }
                  if(success){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return Hub();
                    }));
                  }
                },
                child: Text(
                  'Create new account',
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
              ),

            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10)),
            Text(errorMessage,
              style: TextStyle(color : Colors.red, fontSize: 14),
            ),




          ],
        ),
      ),
    );
  }
}