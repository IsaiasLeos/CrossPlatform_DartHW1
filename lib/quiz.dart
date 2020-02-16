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
    stdout.write(element);
    if (quiz_options.elementAt(count) != 0) {
      stdout.write('\n');
      stdout.write(quiz_options.elementAt(count));
    }
    response = stdin.readLineSync();
    if (response == 'true') {
      response = 1;
    } else if (response == 'false') {
      response = 2;
    }
    quiz_responses.add(response);
    count++;
  });
  printInfo();
  print('Total Grade: ');
  print(calculateGrade());
}

int calculateGrade() {
  var total = 0;
  var questionCount = 0;
  quiz_responses.forEach((answer) {
    if (answer == quiz_answers.elementAt(questionCount)) {
      total++;
    }
    if (quiz_answers.elementAt(questionCount) is List) {
      if ((quiz_answers.elementAt(questionCount) as List).contains(answer)) {
        total++;
      }
    }
    questionCount++;
  });
  return total;
}

void printInfo() {
  stdout.write(
      '\n#########################################################################\n');
  for (var i = 0; i < totalCount; i++) {
    print(quiz_questions.elementAt(i));
    print(quiz_answers.elementAt(i));
    print(quiz_responses.elementAt(i));
  }
  stdout.write(
      '\n#########################################################################\n');
}
