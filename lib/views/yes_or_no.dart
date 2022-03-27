import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_app/widgets/outlined_button.dart';

class YesOrNo extends StatefulWidget {
  const YesOrNo({Key? key}) : super(key: key);

  @override
  State<YesOrNo> createState() => _YesOrNoState();
}

class _YesOrNoState extends State<YesOrNo> {
  static const List<String> _answers = ["Yes!", "No!"];
  static const String _title = "Yes or No?";
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
      floatingActionButton: OutlinedButton(
        child: Text("GENERATE ANSWER"),
        onPressed: () => setState(() {
          _value = (_randomNumber.nextInt(10) % 2);
          _buttonPressed = true;
          _size = 50;
        }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => setState(() {
      //     _value = (randomNumber.nextInt(10) % 2);
      //     buttonPressed = true;
      //     size = 50;
      //   }),
      //   tooltip: 'Generate Button',
      //   child: const Icon(Icons.autorenew_rounded),
      // ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          unselectedItemColor: Color.fromARGB(75, 0, 0, 0),
          selectedItemColor: const Color.fromARGB(255, 99, 181, 248),
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: "Yes or No?"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined),
                label: "Number Generator"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "Name Generator")
          ]),
    );
  }
}
