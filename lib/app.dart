import 'package:flutter/material.dart';
import 'package:random_app/views/name_generator.dart';
import 'package:random_app/views/number_generator.dart';
import 'package:random_app/views/yes_or_no.dart';
import 'package:random_app/views/db_data_gen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const screens = [
    YesOrNo(),
    NumberGenerator(),
    NameGenerator(),
    DBGenerator()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          unselectedItemColor: const Color.fromARGB(75, 0, 0, 0),
          selectedItemColor: const Color.fromARGB(255, 16, 168, 228),
          onTap: (index) => setState(() {
                _currentIndex = index;
              }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: "Yes or No?"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined),
                label: "Number Generator"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "Name Generator"),
            BottomNavigationBarItem(
                icon: Icon(Icons.cloud), label: "DB Data Generator")
          ]),
    );
  }
}
