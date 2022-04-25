import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_app/views/number_generator.dart';

class YesOrNo extends StatefulWidget {
  const YesOrNo({Key? key}) : super(key: key);

  @override
  State<YesOrNo> createState() => _YesOrNoState();
}

class _YesOrNoState extends State<YesOrNo> {
  static const _answers = ["Yes!", "No!"];
  static const String _title = "Yes or No?";
  final Random _randomNumber = Random();
  int _value = 0, currentIndex = 0;
  bool _buttonPressed = false;
  double _size = 20;

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
          backgroundColor: const Color.fromARGB(255, 16, 168, 228),
          heroTag: "generateAnswer",
          onPressed: (() => setState(() {
                _value = (_randomNumber.nextInt(10) % 2);
                _buttonPressed = true;
                _size = 50;
              })),
          label: const Text("GENERATE")),
    );
  }
}
