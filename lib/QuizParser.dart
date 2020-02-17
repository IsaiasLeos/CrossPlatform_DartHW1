import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Questions.dart';

class QuizParser {
  QuizParser();

  ///Makes connection with Cheon's server to obtain a quiz in JSON format.
  Future<String> getQuiz(int quizNumber) async {
    var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0'
        '$quizNumber';
    var response = await http.get(url);
    return response.body; //returns the body of the msg
  }

  ///Parses the questions and assigns them into a list to then compare to
  ///how many questions the user wants and gets done.
  Future<Questions> parseQuestions(var jsonMsg) async {
    var decodedMsg = await jsonMsg;
    var question_repo;
    if (decodedMsg != null) {
      var quiz = json.decode(decodedMsg);
      question_repo = Questions();
      question_repo.quizName = quiz['quiz']['name']; //Quiz Name
      var fixedQuiz = quiz['quiz']['question'] as List; //Question
      fixedQuiz.forEach((element) {
        //Iterate
        question_repo.questions.add(element['stem']); //Gets literal question
        question_repo.answers
            .add(element['answer']); //Gets the answer for the question
        if (element['option'] == null) {
          //assigns 0 because no options are available
          question_repo.options.add(0);
        } else {
          //assigns options if available
          question_repo.options.add(element['option']);
        }
      });
    }
    return question_repo;
  }
}
