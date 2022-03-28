import 'dart:math';
import 'package:flutter/material.dart';

class NumberGenerator extends StatefulWidget {
  const NumberGenerator({Key? key}) : super(key: key);

  @override
  State<NumberGenerator> createState() => _NumberGeneratorState();
}

class _NumberGeneratorState extends State<NumberGenerator> {
  static const _title = "Number Generator";
  final Random _randomNumber = Random();
  double _size = 15;
  bool _buttonPressed = false;

  @override
  Widget build(BuildContext context) => Scaffold(
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
                ? "${_randomNumber.nextInt(20)}"
                : "Press the Generate button below",
            style: TextStyle(fontSize: _size),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (() => setState(() {
                  _buttonPressed = true;
                  _size = 50;
                })),
            label: const Text("GENERATE")),
      );
}
