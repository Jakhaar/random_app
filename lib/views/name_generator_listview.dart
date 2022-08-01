import 'package:flutter/material.dart';

class NameGenListView extends StatefulWidget {
  const NameGenListView({Key? key}) : super(key: key);

  @override
  State<NameGenListView> createState() => _NameGenListViewState();
}

class _NameGenListViewState extends State<NameGenListView> {
  static const _title = "Edit Your List";
  bool _remindMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 16, 168, 228), //change your color here
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: const Text(
          _title,
          style: TextStyle(color: Color.fromARGB(75, 0, 0, 0)),
        ),
      ),
      body: const Center(
        child: Text('No data'),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "addContent",
          child: const Icon(Icons.add),
          onPressed: () {}),
    );
  }
}
