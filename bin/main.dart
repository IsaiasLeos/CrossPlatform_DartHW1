import 'package:quiz/quiz.dart' as quiz;
import 'dart:convert';

Future<void> main(List<String> arguments) async {
  var jsonMsg = await quiz.getQuestion(1);
  if(jsonMsg != null){
    print(jsonMsg);
  }
}
