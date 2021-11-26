import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _text;
  final Function _onPressed;

  Answer(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
          child: Text(_text),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: _onPressed),
    );
  }

}
