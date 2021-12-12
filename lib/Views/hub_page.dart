import 'package:fantastic_five_name_game/Utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_page.dart';

class Hub extends StatefulWidget {
  @override
  _HubState createState() => _HubState();
}

class _HubState extends State<Hub> {

  User? user = firebaseAuth.currentUser;
  bool signedIn = false;

  @override
  Widget build(BuildContext context) {
    getSignInStatus(user);
    return Scaffold(
        appBar: AppBar(
          title: Text('Hub Page'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent.shade700,
          actions: <Widget>[
            buildLogoutButton()
          ],
        ),

        body: Center(
            child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 50
                    ),

                    child: ElevatedButton(
                      child: Text("Start Quiz"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Quiz())
                        );
                      },

                    ),
                  ),
                ]
            )
        )
    );
  }
  void getSignInStatus(user){
    if(user != null){
      setState(() {
        signedIn = true;
      });
    }
    else{
      setState(() {
        signedIn = false;
      });
    }
  }

  Widget buildLogoutButton(){
    return new TextButton(child: new Text(
      signedIn ? 'Logout' : 'Guest',
      style: TextStyle(color: Colors.white),),
      onPressed: signedIn ? Logout : null,
    );
  }

  void Logout(){
    firebaseAuth.signOut();
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

}