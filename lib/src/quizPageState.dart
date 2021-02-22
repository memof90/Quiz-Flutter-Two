import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiztwo/src/controller/quiz_brain.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Present icons to error o good
  List<Icon> sckoreKeeper = [];
// Object to pass data list quiz_brain
  QuizBrain quizBrain = QuizBrain();
  bool correctAnswers;
  void checkAnswer(bool userPickerAnswer) => {
        correctAnswers = quizBrain.getQuestionAnswer(),
        setState(() {
          if (quizBrain.isFinished() == true) {
            Alert(
                    context: context,
                    title: 'Finished!',
                    desc: 'you\'ve reached the end of the quiz')
                .show();
            quizBrain.reset();
            sckoreKeeper = [];
          } else {
            if (userPickerAnswer == correctAnswers) {
              sckoreKeeper.add(Icon(
                Icons.check_box_rounded,
                color: Colors.green,
              ));
            } else {
              sckoreKeeper.add(Icon(
                Icons.close_rounded,
                color: Colors.red,
              ));
            }
            quizBrain.validNextQuestion();
          }
        })
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.cyan[200],
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(quizBrain.getQuestionImage()),
                      fit: BoxFit.cover,
                      alignment: Alignment.center),
                ),
              ),
            )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text(
              'True',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () => {checkAnswer(true)},
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.redAccent,
            child: Text(
              'False',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () => {checkAnswer(false)},
          ),
        )),
        Row(
          children: sckoreKeeper,
        )
      ],
    );
  }
}
