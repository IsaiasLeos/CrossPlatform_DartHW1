import 'dart:io';
import 'QuizParser.dart';
import 'QuizController.dart';

var valueOfGrade;

///Handles what is gonna be shown in the console.
void showUI() async {
  var input = '';
  var input2 = '';
  var quiz;
  var quiz_parser = QuizParser();
  stdout.write('\nWelcome!\n');
  stdout.write('What quiz would you like?');
  input2 = stdin.readLineSync();//selecting quiz
  stdout.write('How many questions do you want (1-10)?');
  input = stdin.readLineSync();//selecting question amount
  valueOfGrade = int.parse(input);//for calculation of quiz grade
  var jsonMsg = await quiz_parser.getQuiz(int.parse(input2));//json body
  var repo = await quiz_parser.parseQuestions(jsonMsg);//parsing json body.
  quiz = await QuizController.question_repo(repo);//initialize quiz controller
  await quiz.manage(int.parse(input));
  await quiz.manageQuestions();
  stdout.write('Total Grade: ');
  stdout.write((await quiz.calculateGrade() / valueOfGrade) * 100);//calculate grade
  stdout.write('\n');
}
