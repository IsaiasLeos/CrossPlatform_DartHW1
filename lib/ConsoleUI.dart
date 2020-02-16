import 'dart:convert';
import 'dart:io';
import 'package:quiz/Quiz.dart' as quiz;
import 'package:quiz/QuizParser.dart' as quiz_parser;

void showUI() async {
  var input = '';
  stdout.write('Welcome!\n');
  stdout.write('How many questions do you want (1-10)? ');
  input = stdin.readLineSync();
  var jsonMsg = await quiz_parser.getQuiz(1);
  await quiz_parser.parseQuestions(jsonMsg);
  await quiz.manage(int.parse(input));
}
