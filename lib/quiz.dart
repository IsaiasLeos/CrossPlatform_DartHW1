import 'dart:io';
import 'package:quiz/Questions.dart' as question_repo;

List<String> quiz_questions = <String>[];
List<dynamic> quiz_answers = <dynamic>[];
List<dynamic> quiz_responses = <dynamic>[];
List<dynamic> quiz_options = <dynamic>[];

var totalCount = 0;

void manage(int questionCount) {
  totalCount += questionCount;
  for (var i = 0; i < questionCount; i++) {
    quiz_questions.add(question_repo.questions.elementAt(i));
    quiz_answers.add(question_repo.answers.elementAt(i));
    quiz_options.add(question_repo.options.elementAt(i));
  }
  manageQuestions();
}

void manageQuestions() {
  var response;
  var count = 0;
  quiz_questions.forEach((element) {
    print(element);
    if (quiz_options.elementAt(count) != 0) {
      print(quiz_options.elementAt(count));
    }
    response = stdin.readLineSync();
    quiz_responses.add(response);
    count++;
  });
  printInfo();
}

void printInfo() {
  print(
      '#########################################################################');
  for (var i = 0; i < totalCount; i++) {
    print(quiz_questions.elementAt(i));
    print(quiz_answers.elementAt(i));
    print(quiz_options.elementAt(i));
    print(quiz_responses.elementAt(i));
  }
}
