import '../Model/question.dart';
import '../Model/quiz.dart';

/// Creates a debug quiz. For testing purposes only.
Quiz debugQuizBuilder() {
  Question one = Question("Is this a test?",
      ["Yes", "No", "What's a test?", "Who's a test?", "Hilarious joke goes here"],
      "Yes");
  Question two = Question("What is the airspeed velocity of an unladen swallow?",
      ["c", "21 m/(mol*s)", "2fast", "x>0", "African or European?"],
      "African or European?");
  Quiz debugQuiz = Quiz([one, two]);
  return debugQuiz;
}

class QuizPresenter {
  /// Quiz to be run. Use one of the quiz builder methods to create this.
  final _quiz = debugQuizBuilder();

  /// Initialize a quiz and return the first question.
  ///
  /// Displaying questions and allowing input should be handled by the UI.
  void initQuiz() {
    _quiz.questionIndex = 0;
    _quiz.score = 0;
  }

  /// Return the current quiz question.
  String getQuestion() {
    return _quiz.questions[_quiz.questionIndex].question;
  }

  /// Return the list of answers to the quiz question
  List<String> getAnswers() {
    return _quiz.questions[_quiz.questionIndex].answers;
  }

  /// Return the number of questions in a quiz
  int getQuizLength() {
    return _quiz.questions.length;
  }

  /// Get current quiz question index (indexes from 0).
  int getQuizIndex() {
    return _quiz.questionIndex;
  }

  /// Check if the answer to q question is correct. Only call once per question.
  ///
  /// If [answer] is a correct answer, the score will increase by one and true will be returned.
  /// Else, false will be returned.
  bool checkQuestion(String answer) {
    if (answer == _quiz.questions[_quiz.questionIndex].correct) {
      // Add one to the score if the answer is correct
      _quiz.score += 1;
      return true;
    } else {
      return false;
    }
  }

  /// Progress to the next question of the quiz.
  ///
  /// Returns the next question if the quiz isn't already on the final question.
  /// If the quiz is on the final question it will throw an [Exception].
  Question nextQuestion() {
    // check if increasing the questionIndex will put it out of bounds
    if (_quiz.questionIndex < _quiz.questions.length - 1) {
      // increae question index by one
      _quiz.questionIndex++;
      // return next question
      return _quiz.questions[_quiz.questionIndex];
    } else {
      throw Exception("ERROR: Ran nextQuestion on the final question of a quiz");
    }
  }
}