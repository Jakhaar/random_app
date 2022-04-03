import 'dart:math';
import 'package:flutter/material.dart';

class NumberGenerator extends StatefulWidget {
  const NumberGenerator({Key? key}) : super(key: key);

  @override
  State<NumberGenerator> createState() => _NumberGeneratorState();
}

class _NumberGeneratorState extends State<NumberGenerator> {
  static const _title = "Number Generator";
  static const double _sliderMinValue = 2;
  static const double _sliderMaxValue = 100;
  int? _answer;
  double? _size;
  double _sliderValue = 30, newValue = 0;

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
                "${_answer ?? "Press Generate"}",
                style: TextStyle(fontSize: _size ?? 15.0),
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
              const Text(
                "Use the slider to select the upper bound",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (() => setState(() {
                  _answer = Random().nextInt(_sliderValue.toInt());
                  _size = 50;
                })),
            label: const Text("GENERATE")),
      );
}
