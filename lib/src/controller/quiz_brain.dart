import 'package:quiztwo/src/model/questionModel.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(i: 'assets/1.jpg', q: 'This is Capitan America', a: true),
    Question(i: 'assets/2.jpg', q: 'This is Spiderman', a: false),
    Question(i: 'assets/3.jpg', q: 'This is Thor', a: true),
    Question(i: 'assets/4.jpg', q: 'This is Iroman', a: false),
  ];
  // fuction to pass image
  String getQuestionImage() => _questionBank[_questionNumber].questionImage;
  // function to pass text
  String getQuestionText() => _questionBank[_questionNumber].questionText;
  // uftcon to answer
  bool getQuestionAnswer() => _questionBank[_questionNumber].questionAnswer;

  // function to valide index and eviate crashed
  void validNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // finished game
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now return true');
      return true;
    } else {
      return false;
    }
  }

  // Create reset
  void reset() {
    _questionNumber = 0;
  }
}
