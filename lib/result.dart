import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _resultScore;
  final VoidCallback _resetQuiz;

  Result(this._resultScore, this._resetQuiz);

  String get resultPhrase {
    if (_resultScore <= 15) {
      return 'You are awesome';
    } else {
      return 'Well, could be better';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$resultPhrase score: $_resultScore",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: _resetQuiz,
            child: Text('Restart quiz!'),
            color: Colors.blue,
            textColor: Colors.white,
          )
        ]);
  }
}
