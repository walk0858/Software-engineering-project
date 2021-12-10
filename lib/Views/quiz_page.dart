import 'dart:io';

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
  var questionWidget;

  // widget vars
  var message;

  void answerButtonCheck(String answer) async {
    bool isCorrect = presenter.checkQuestion(answer);
    if (isCorrect) {
      setState(() {
        // display correct message text
        message = "Correct! +1 Points";
      });
    } else {
      String correct = presenter.getCorrectAnswer();
      // display incorrect message text and the correct answer
      setState(() {
        message = "Incorrect. The answer was $correct";
      });
    }

    // wait for 1 second to allow user to see if they got the question right
    Future.delayed(const Duration(seconds: 1), () {
      if (presenter.getQuizIndex() < presenter.getQuizLength()-1) {
        presenter.nextQuestion();
        setState(() {
          buildQuestionPage();
        });
      }
    });
  }

  void buildQuestionPage() {
    message = presenter.getQuestion();
    List<String> answers = presenter.getAnswers();

    setState(() {
      questionWidget = Scaffold(
        appBar: AppBar(
          title: const Text("Quiz"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent.shade700,
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              Text(message,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // display current quiz question
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