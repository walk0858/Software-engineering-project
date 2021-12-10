import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Presenters/quiz_presenter.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

Scaffold buildQuestionPage(QuizPresenter presenter) {
  String question = presenter.getQuestion();
  List<String> answers = presenter.getAnswers();

  Scaffold questionScaffold = Scaffold(
    appBar: AppBar(
      // display current quiz question
      title: Text(question),
      centerTitle: true,
      backgroundColor: Colors.blueAccent.shade700,
    ),

    body: Center(
      child: Column(
        children: <Widget>[

          ElevatedButton(
            child: Text(answers[0]),
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent
            ),
            onPressed: () {},
          ),

          ElevatedButton(
            child: Text(answers[1]),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue
            ),
            onPressed: () {},
          ),

          ElevatedButton(
            child: Text(answers[2]),
            style: ElevatedButton.styleFrom(
                primary: Colors.green
            ),
            onPressed: () {},
          ),

          ElevatedButton(
            child: Text(answers[3]),
            style: ElevatedButton.styleFrom(
                primary: Colors.orange
            ),
            onPressed: () {},
          ),

          ElevatedButton(
            child: Text(answers[4]),
            style: ElevatedButton.styleFrom(
                primary: Colors.purpleAccent
            ),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
  return questionScaffold;
}

class _QuizState extends State<Quiz> {
  // quiz presenter.
  QuizPresenter presenter = QuizPresenter();

  // question page variable
  Scaffold questionWidget = Scaffold();

  @override
  void initState() {
    super.initState();

    // start the quiz
    questionWidget = buildQuestionPage(presenter);
  }

  @override
  Widget build(BuildContext context) {
    return questionWidget;
  }
}