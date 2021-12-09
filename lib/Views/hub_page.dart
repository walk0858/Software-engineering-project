import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hub extends StatefulWidget {
  @override
  _HubState createState() => _HubState();
}

class _HubState extends State<Hub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hub Page'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent.shade700,
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
                      onPressed: () {},

                    ),
                  ),
                ]
            )
        )
    );
  }
}