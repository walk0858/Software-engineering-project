/// Stores a question

class Question {
  /// The question
  String question = "Placeholder?";

  /// Possible answers for the question
  List<String> answers = [];

  /// The correct answer to the question
  String correct = "Placeholder?";

  /// Constructs a Question object
  ///
  /// Question is questionText, list of answers is answerList, and correctText
  /// is a string from answerList that is the correct answer. If correctText
  /// is not in the answerList an [Exception] will be thrown.
  Question(String questionText, List<String> answerList, String correctText) {
    question = questionText;
    answers = answerList;
    correct = correctText;
    // Check if the correctText is part of the answer, if not, throw and error
    if (!answers.contains(correctText)) {
      throw Exception("correctText is not in the answer list");
    }
  }
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