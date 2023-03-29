import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//void main() {
// runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Jaki jest twój ulubiony kolor?',
      'answers': [
        {'text': 'Czarny', 'wynik': 10},
        {'text': 'Czerwony', 'wynik': 2},
        {'text': 'Zielony', 'wynik': 6},
        {'text': 'Biały', 'wynik': 8}
      ],
    },
    {
      'questionText': 'Jakie jest twoje ulubione zwięrzątko?',
      'answers': [
        {'text': 'Królik', 'wynik': 8},
        {'text': 'Wąż', 'wynik': 6},
        {'text': 'Słoń', 'wynik': 10},
        {'text': 'Lew', 'wynik': 2},
      ],
    },
    {
      'questionText': 'Kto jest twoim ulubionym sportowcem?',
      'answers': [
        {'text': 'Cristiano Ronaldo', 'wynik': 8},
        {'text': 'Lionel Messi', 'wynik': 6},
        {'text': 'Kamil Glik', 'wynik': 10},
        {'text': 'Robert Lewandowski', 'wynik': 2},
      ],
    },
  ];
  var _questionIndex = 0;
  var _koncowyWynik = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _koncowyWynik = 0;
    });
  }

  void _answerQuestion(int wynik) {
    _koncowyWynik += wynik;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Mamy więcej pytać!');
    } else {
      print('Nie mamy więcej pytań');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first app'),
            backgroundColor: Color.fromARGB(235, 66, 18, 108),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_koncowyWynik, _resetQuiz)),
    );
  }
}
