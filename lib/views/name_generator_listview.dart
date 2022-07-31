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
        onPressed: () {
          Widget remindButton = TextButton(
            child: const Text("Remind me later"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
          // Widget cancelButton = TextButton(
          //   child: const Text("Cancel"),
          //   onPressed: () {
          //     return;
          //   },
          // );
          Widget launchButton = ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    // textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _remindMe = false;
                    Navigator.of(context).pop();
                  },
                  child: const Text('Got it!'),
                ),
              ],
            ),
          );

          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Notice"),
            content: const Text(
                "All the entered Data will be Stored in a Database."),
            actions: [
              // cancelButton,
              remindButton,
              launchButton,
            ],
          );

          // show the dialog
          if (_remindMe) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );
          }
        },
      ),
    );
  }
}
