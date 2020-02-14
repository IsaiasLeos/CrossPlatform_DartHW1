import 'package:http/http.dart' as http;

/// Obtains the quiz from CHEON's website given the integer provided.
Future<String> getQuestion(int quizNumber) async {
  var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0'
      '$quizNumber';
  var response = await http.get(url);
  return response.body; //returns only the body
}
