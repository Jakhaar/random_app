import 'package:flutter/material.dart';
import 'package:random_app/views/yes_or_no.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YesOrNo(),
    );
  }
}
