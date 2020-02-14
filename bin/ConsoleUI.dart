import 'dart:convert';
import 'package:quiz/QuizParser.dart' as quiz;

Future<void> main(List<String> arguments) async {
  var jsonMsg = await quiz.getQuestion(1); //Obtain quiz 1
  //Make sure it isn't null
  if (jsonMsg != null) {
    //decode the json string
    Map<String, dynamic> quiz = json.decode(jsonMsg) as Map;
    //Iterate through the questions inside the quiz

    for (var i = 0; i < 10; i++) {
      var questionDesc = quiz['quiz']['question'][i];
      //print the type of question i.e. multiple choice vs fill in
      switch (questionDesc['type']) {
        case 1:
          print('Multiple Choice: ');
          break;
        case 2:
          print('Fill In');
          break;
        default:
      }
      //print the question itself
      print('Question: ' + questionDesc['stem']);
      //print the answer of the question
      print('Answer: ' + questionDesc['answer'].toString());
    }
  }
}
