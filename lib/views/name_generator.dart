import 'dart:math';

import 'package:flutter/material.dart';

class NameGenerator extends StatefulWidget {
  const NameGenerator({Key? key}) : super(key: key);

  @override
  State<NameGenerator> createState() => _NameGeneratorState();
}

class _NameGeneratorState extends State<NameGenerator> {
  final List<String> _answers = [];
  static const String _title = "Name Generator";
  final Random _randomNumber = Random();
  int _index = 0, currentIndex = 0;
  double? _textSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _answers.isEmpty ? "Create a list first" : _answers[_index],
              style: TextStyle(fontSize: _textSize ?? 15),
            ),
            ElevatedButton(
              onPressed: null,
              child:
                  Text(_answers.isEmpty ? "Create a list first" : "Edit list"),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _answers.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: (() => setState(() {
                    _index = (_randomNumber.nextInt(_answers.length) %
                        _answers.length);
                    _textSize = 50;
                  })),
              label: const Text("GENERATE")),
    );
  }
}
