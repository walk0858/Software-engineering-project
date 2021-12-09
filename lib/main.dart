import 'package:fantastic_five_name_game/Utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Views/hub_page.dart';
import 'Views/newAccount_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.length == 0)
    {Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: firebaseAPIkey,
          appId: firebaseID,
          messagingSenderId: firebaseProjectNum,
          projectId: firebaseProjectID)
  );}
  else{
    Firebase.app();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Name Game Sign in page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String userName = '';
  String password ='';
  String errorMessage = '';

  void setErrorMessage(String message){
    setState(() {
      errorMessage = message;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),

              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text){
                  userName =text;
                },
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),

              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                    hintText: 'Enter your password'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text){
                  password =text;
                },
              ),
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  bool success = false;

                  if(userName == '' || password==''){
                    setErrorMessage('Must enter user name and password');
                  }
                  else {
                    try {
                       await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: userName, password: password);
                      success = true;
                    }
                    on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        setErrorMessage('Email not found');
                      }
                      if (e.code == 'wrong-password') {
                        setErrorMessage('Password is incorrect');
                      }
                    }
                  }

                  if(success){
                    setErrorMessage('Login Successful');
                  }
                  },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),

            ),

            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),

            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10)
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>create_account()));
                },
                child: const Text(
                  'Create New Account',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),

            ),

            const Padding(
              padding : EdgeInsets.symmetric(vertical: 15, horizontal: 15)
            ),


            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return Hub();
                  }));
                },
                child: const Text(
                  'Continue as guest',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),

            ),

          ],
        ),
      ),

    );
  }
}



