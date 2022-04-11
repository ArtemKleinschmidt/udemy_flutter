import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:udemy_flutter_app/answer.dart';
import 'package:udemy_flutter_app/question.dart';

import 'Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const questionKey = "question";
    const answersKey = "answers";

    final questions = [
      QuizItem("What's your favorite color?", [
        AnswerItem("Black", 10),
        AnswerItem("Red", 5),
        AnswerItem("Green", 3),
        AnswerItem("White", 1),
      ]),
      QuizItem("What's your favorite animal?", [
        AnswerItem("Snake", 10),
        AnswerItem("Horse", 5),
        AnswerItem("Cat", 3),
        AnswerItem("Dog", 1),
      ]),
      QuizItem("What's your favorite language?", [
        AnswerItem("JavaScript", 10),
        AnswerItem("Java", 5),
        AnswerItem("Dart", 3),
        AnswerItem("Kotlin", 1),
      ]),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          "Awesome app",
        )),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[_questionIndex].question),
                  ...(questions[_questionIndex].answers).map(
                    (answer) => Answer(
                        answer.answer, () => _answerQuestion(answer.score)),
                  ),
                ],
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }

  void _answerQuestion(int score) {
    log("Answer clicked ");
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }
}

class QuizItem {
  final String question;
  final List<AnswerItem> answers;

  QuizItem(this.question, this.answers);
}

class AnswerItem {
  final String answer;
  final int score;

  AnswerItem(this.answer, this.score);
}
