/// Stores a question

class Question {
  /// The question
  String question = "Placeholder?";

  /// Lossible answers for the question
  List<String> answers = [];

  /// The correct answer to the question
  String correct = "Placeholder?";

  /// Returns true if answer is correct, and false if it is incorrect
  bool checkAnswer(String answer) {
    return answer == correct;
  }

  /// Returns question
  String getQuestion() {
    return question;
  }

  /// Return list of answers
  List<String> getAnswers() {
    return answers;
  }
}