import 'dart:math';
import 'package:flutter/material.dart';

class NumberGenerator extends StatefulWidget {
  const NumberGenerator({Key? key}) : super(key: key);

  @override
  State<NumberGenerator> createState() => _NumberGeneratorState();
}

class _NumberGeneratorState extends State<NumberGenerator> {
  static const _title = "Number Generator";
  static const double _size = 50;
  double _sliderValue = 30, newValue = 0;
  static const double _sliderMinValue = 2;
  static const double _sliderMaxValue = 100;
  int? _answer;

  @override
  Widget build(BuildContext context) => Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${_answer ?? "0"}",
                style: const TextStyle(fontSize: _size),
              ),
              Slider(
                value: _sliderValue,
                onChanged: (newValue) => setState(() {
                  _sliderValue = newValue;
                }),
                max: _sliderMaxValue,
                min: _sliderMinValue,
                label: "${_sliderValue.toInt()}",
                divisions: 100,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (() => setState(() {
                  _answer = Random().nextInt(_sliderValue.toInt());
                })),
            label: const Text("GENERATE")),
      );
}
