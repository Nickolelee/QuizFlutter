import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int wynikKoncowy;
  final Function restartowyPrzycisk;

  Result(this.wynikKoncowy, this.restartowyPrzycisk);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (wynikKoncowy <= 8) {
      resultText = 'Jesteś niesamowity!';
    } else if (wynikKoncowy <= 12) {
      resultText = 'Można cię polubić!';
    } else if (wynikKoncowy <= 16) {
      resultText = 'Jesteś dziwny';
    } else {
      resultText = 'Jesteś słaby';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(144, 58, 187, 1)),
            ),
            child: Text('Zrestaruj Quiz!'),
            onPressed: restartowyPrzycisk,
          ),
        ],
      ),
    );
  }
}
