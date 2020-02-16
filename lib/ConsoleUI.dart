import 'dart:io';
import 'QuizParser.dart';
import 'QuizController.dart';

var valueOfGrade;

void showUI() async {
  var input = '';
  var input2 = '';
  var quiz;
  var quiz_parser = QuizParser();
  stdout.write('\nWelcome!\n');
  stdout.write('What quiz would you like?');
  input2 = stdin.readLineSync();
  stdout.write('How many questions do you want (1-10)?');
  input = stdin.readLineSync();
  valueOfGrade = int.parse(input);
  var jsonMsg = await quiz_parser.getQuiz(int.parse(input2));
  var repo = await quiz_parser.parseQuestions(jsonMsg);
  quiz = await QuizController.question_repo(repo);
  await quiz.manage(int.parse(input));
  await quiz.manageQuestions();
  stdout.write('Total Grade: ');
  stdout.write((await quiz.calculateGrade() / valueOfGrade) * 100);
  stdout.write('\n');
}
