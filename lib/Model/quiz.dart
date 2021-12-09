import 'question.dart';

/// Quiz class
class Quiz {
  /// List of questions
  List<Question> questions = [];
  /// Stores the current quiz question (indexes from 0)
  int questionIndex = 0;
  /// Score on the quiz
  int score = 0;
  /// Returns the current question in the quiz
  Question getCurQuestion() {
    return questions[questionIndex];
  }

}