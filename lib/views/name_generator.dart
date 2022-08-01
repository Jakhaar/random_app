import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_app/views/name_generator_listview.dart';

class NameGenerator extends StatefulWidget {
  const NameGenerator({Key? key}) : super(key: key);

  @override
  State<NameGenerator> createState() => _NameGeneratorState();
}

class _NameGeneratorState extends State<NameGenerator> {
  final _answers = [];
  static const String _title = "Name Generator";
  final Random _randomNumber = Random();
  int _index = 0;
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
              style: TextStyle(fontSize: _textSize ?? 20),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 16, 168, 228),
              heroTag: "editList",
              child: const Icon(Icons.edit),
              onPressed: (() async {
                final data = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const NameGenListView(),
                  ),
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _answers.isEmpty
          ? null
          : FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 16, 168, 228),
              heroTag: "generateName",
              onPressed: (() => setState(() {
                    _index = (_randomNumber.nextInt(_answers.length) %
                        _answers.length);
                    _textSize = 50;
                  })),
              label: const Text("GENERATE")),
    );
  }
}
