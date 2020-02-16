import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Questions.dart';

class QuizParser {
  QuizParser() {}
  Future<String> getQuiz(int quizNumber) async {
    var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0'
        '$quizNumber';
    var response = await http.get(url);
    return response.body;
  }

  Future<Questions> parseQuestions(var jsonMsg) async {
    var decodedMsg = await jsonMsg;
    var question_repo;
    if (decodedMsg != null) {
      var quiz = json.decode(decodedMsg);
      question_repo = Questions();
      question_repo.quizName = quiz['quiz']['name'];
      var fixedQuiz = quiz['quiz']['question'] as List;
      fixedQuiz.forEach((element) {
        question_repo.questions.add(element['stem']);
        question_repo.answers.add(element['answer']);
        if (element['option'] == null) {
          question_repo.options.add(0);
        } else {
          question_repo.options.add(element['option']);
        }
      });
    }
    return question_repo;
  }
}
