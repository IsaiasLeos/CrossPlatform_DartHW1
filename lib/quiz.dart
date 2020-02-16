import 'dart:io';
import 'package:quiz/Questions.dart' as question_repo;

List<String> quiz_questions = <String>[];

void manage(int questionCount) {
  for (var i = 0; i < questionCount; i++) {
    quiz_questions.add(question_repo.questions.elementAt(i));
  }
  manageQuestions();
}

void manageQuestions() {
  var response;
  quiz_questions.forEach((element) {
    print(element);
    response = stdin.readLineSync();
  });
}
