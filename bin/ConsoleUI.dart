import 'dart:convert';

import 'package:quiz/QuizParser.dart' as quiz;

Future<void> main(List<String> arguments) async {
  var jsonMsg = await quiz.getQuestion(1); //Obtain quiz 1
  //Make sure it isn't null
  if (jsonMsg != null) {
    //decode the json string
    var quiz = json.decode(jsonMsg);
    //Iterate through the questions inside the quiz
    var fixedQuiz = quiz['quiz']['question'] as List;
    fixedQuiz.forEach((element) {
      //print the type of question i.e. multiple choice vs fill in
      switch (element['type']) {
        case 1:
          print('Multiple Choice: ');
          break;
        case 2:
          print('Fill In');
          break;
        default:
      }
      //print the question itself
      print('Question: ' + element['stem']);
      //print the answer of the question
      print('Answer: ' + element['answer'].toString());
    });
  }
}
