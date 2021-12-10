import 'question.dart';

/// Quiz class
class Quiz {
  /// List of questions
  List<Question> questions = [];
  /// Stores the current quiz question (indexes from 0)
  int questionIndex = 0;
  /// Score on the quiz
  int score = 0;

  /// Constructs a Quiz from a list of questions
  ///
  /// [questionList] is the list of questions to be included on the quiz.
  Quiz(List<Question> questionList) {
    questions = questionList;
  }

  /// Returns the current question in the quiz
  Question getCurQuestion() {
    return questions[questionIndex];
  }

}