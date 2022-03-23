import 'dart:math';

import 'package:flutter/material.dart';

class YesOrNo extends StatefulWidget {
  const YesOrNo({Key? key}) : super(key: key);

  @override
  State<YesOrNo> createState() => _YesOrNoState();
}

class _YesOrNoState extends State<YesOrNo> {
  final List<String> answer = ["Yes!", "No!"];
  final String _title = "Yes or No?";
  final Random randomNumber = Random();
  int _value = 0;
  bool buttonPressed = false;
  double size = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Text(
          _title,
          style: const TextStyle(color: Color.fromARGB(75, 0, 0, 0)),
        ),
      ),
      body: Center(
        child: Text(
          buttonPressed == true
              ? answer[_value]
              : "Press the Generate button below",
          style: TextStyle(fontSize: size),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => {
              _value = (randomNumber.nextInt(10) % 2),
              buttonPressed = true,
              size = 50
            }),
        tooltip: 'Generate Button',
        child: const Icon(Icons.autorenew_rounded),
      ),
    );
  }
}
