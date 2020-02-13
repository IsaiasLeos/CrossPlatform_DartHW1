import 'dart:io';
import 'package:http/http.dart' as http;

var jsonBody;

Future<String> getQuestion(int quizNumber) async {
  var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0' +
      '$quizNumber';
  var response = await http.get(url);
  print('${response.body}');
  jsonBody = response.body;
}
