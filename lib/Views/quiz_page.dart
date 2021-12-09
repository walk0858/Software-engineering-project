import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade700,
      ),

      body: Center(
        child: Column(
            children: <Widget>[

              ElevatedButton(
               child: Text("A"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent
                ),
               onPressed: () {},
             ),

              ElevatedButton(
               child: Text("B"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue
                ),
               onPressed: () {},
             ),

              ElevatedButton(
                child: Text("C"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green
                ),
                onPressed: () {},
               ),

              ElevatedButton(
                child: Text("D"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange
                ),
                onPressed: () {},
              ),

              ElevatedButton(
                child: Text("E"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
    }
}