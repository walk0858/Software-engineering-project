import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Presenters/quiz_presenter.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // quiz presenter.
  QuizPresenter presenter = QuizPresenter();

  // question page variable
  Scaffold questionWidget = Scaffold();

  void answerButtonCheck(String answer) {
    bool isCorrect = presenter.checkQuestion(answer);
    if (presenter.getQuizIndex() < presenter.getQuizLength()-1) {
      presenter.nextQuestion();
      setState(() {
        buildQuestionPage();
      });
    }
  }

  void buildQuestionPage() {
    String question = presenter.getQuestion();
    List<String> answers = presenter.getAnswers();
    setState(() {
      questionWidget = Scaffold(
        appBar: AppBar(
          // display current quiz question
          title: const Text("Quiz"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent.shade700,
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              Text(question,
              style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                child: Text(answers[0]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent
                ),
                onPressed: () {
                  answerButtonCheck(answers[0]);
                  },
              ),

              ElevatedButton(
                child: Text(answers[1]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue
                ),
                onPressed: () {
                  answerButtonCheck(answers[1]);
                },
              ),

              ElevatedButton(
                child: Text(answers[2]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green
                ),
                onPressed: () {
                  answerButtonCheck(answers[2]);

                },
              ),

              ElevatedButton(
                child: Text(answers[3]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange
                ),
                onPressed: () {
                  answerButtonCheck(answers[3]);
                },
              ),

              ElevatedButton(
                child: Text(answers[4]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent
                ),
                onPressed: () {
                  answerButtonCheck(answers[4]);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    // start the quiz
    buildQuestionPage();
  }

  @override
  Widget build(BuildContext context) {
    return questionWidget;
  }
}