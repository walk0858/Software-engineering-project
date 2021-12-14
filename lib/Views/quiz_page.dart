import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import '../Presenters/quiz_presenter.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // quiz presenter.
  QuizPresenter presenter = QuizPresenter.debugQuizBuilder();
  // audio players
  final musicPlayer = AssetsAudioPlayer();
  final endQuizSFX = AssetsAudioPlayer();
  final correctSFX = AssetsAudioPlayer();
  final wrongSFX = AssetsAudioPlayer();

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

    setState(() {
      updateMessage(message);
    });

    // wait for 1 second to allow user to see if they got the question right
    Future.delayed(const Duration(seconds: 4), () {
      if (presenter.getQuizIndex() < presenter.getQuizLength()-1) {
        presenter.nextQuestion();
        setState(() {
          updateQuestionPage(presenter.getQuestion());
        });
      } else {
        setState(() {
          displayResults();
        });
      }
    });
  }

  /// Updates the question page for a new question
  void updateQuestionPage(String message) {
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

  /// Updates the message and deactivates the buttons
  void updateMessage(String message) {
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
                onPressed: null
              ),

              ElevatedButton(
                child: Text(answers[1]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue
                ),
                onPressed: null
              ),

              ElevatedButton(
                child: Text(answers[2]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green
                ),
                onPressed: null
              ),

              ElevatedButton(
                child: Text(answers[3]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange
                ),
                onPressed: null
              ),

              ElevatedButton(
                child: Text(answers[4]),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent
                ),
                onPressed: null
              ),
            ],
          ),
        ),
      );
    });
  }

  /// Displays the results screen, and how many questions the user got right
  void displayResults() {
    // stop music and play completion sound
    musicPlayer.stop();
    // Set message to display the score out of 10.
    int score = presenter.getScore();
    int length = presenter.getQuizLength();
    double percent = score/length;
    double result = (score/length) * 100;
    message = "Congratulations! You got $score/$length questions correct.";
    questionWidget = Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade700,
      ),

      body: Center(
        child: Column(

          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(8.0,20.0,8.0,80.0),
                child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 50),
             ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0,20.0,8.0,20.0),
              child: Text(
                result.toString() + " %",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            CircularProgressIndicator(
              value: percent,
              semanticsLabel: 'Percentage',
              strokeWidth: 7,
              color: Colors.green,
              backgroundColor: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0,50.0,8.0,20.0),
              child: ElevatedButton(
                child: Text("Take the Quiz Again"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quiz())
                  );
                }, // onPressed
              ),
            ),
          ]
        )
      )
    );
  }

  @override
  void initState() {
    super.initState();
    // Initialize audio
    musicPlayer.open(
      Audio("assets/audio/Cyberpunk Moonlight Sonata v2.mp3"),
      autoStart: true,
      loopMode: LoopMode.single,
    );
    endQuizSFX.open(
      Audio("assets/audio/24.wav"),
      autoStart: false,
    );
    correctSFX.open(
      Audio("assets/audio/completetask_0.mp3"),
      autoStart: false,
    );
    endQuizSFX.open(
      Audio("assets/audio/alarm.ogg"),
      autoStart: false,
    );

    presenter = QuizPresenter.debugQuizBuilder();
    // start the quiz
    updateQuestionPage(presenter.getQuestion());
  }

  @override
  Widget build(BuildContext context) {
    return questionWidget;
  }
}