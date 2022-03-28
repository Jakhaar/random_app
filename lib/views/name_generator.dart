import 'dart:math';

import 'package:flutter/material.dart';

class NameGenerator extends StatefulWidget {
  const NameGenerator({Key? key}) : super(key: key);

  @override
  State<NameGenerator> createState() => _NameGeneratorState();
}

class _NameGeneratorState extends State<NameGenerator> {
  static const _answers = ["Joao", "Antonio", "ABC", "DEF"];
  static const String _title = "Name Generator";
  final Random _randomNumber = Random();
  int _value = 0, currentIndex = 0;
  bool _buttonPressed = false;
  double _size = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: const Text(
          _title,
          style: TextStyle(color: Color.fromARGB(75, 0, 0, 0)),
        ),
      ),
      body: Center(
        child: Text(
          _buttonPressed == true
              ? _answers[_value]
              : "Press the Generate button below",
          style: TextStyle(fontSize: _size),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (() => setState(() {
                _value = (_randomNumber.nextInt(_answers.length) %
                    (_answers.length - 1));
                _buttonPressed = true;
                _size = 50;
              })),
          label: const Text("GENERATE")),
    );
  }
}
