import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:udemy_flutter_app/answer.dart';
import 'package:udemy_flutter_app/question.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const questionKey = "question";
    const answersKey = "answers";
    const questions = [
      {
        questionKey: "What's your favorite color?",
        answersKey: ["Black", "White", "Red", "Green"]
      },
      {
        questionKey: "What's your favorite animal?",
        answersKey: ["Dog", "Cat", "Horse", "Snake"]
      },
      {
        questionKey: "What's your favorite language?",
        answersKey: ["Java", "Kotlin", "Dart", "JavaScript"]
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          "Awesome app",
        )),
        body: Column(
          children: [
            Question(questions[_questionIndex][questionKey]),
            ...(questions[_questionIndex][answersKey] as List<String>).map(
              (answer) => Answer(answer, _answerQuestion),
            ),
          ],
        ),
      ),
    );
  }

  void _answerQuestion() {
    log("Answer clicked ");
    setState(() {
      _questionIndex += 1;
    });
  }
}
