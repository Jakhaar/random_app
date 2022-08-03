import 'package:flutter/material.dart';
import 'package:random_app/logic/api/api_service.dart';
import 'package:random_app/logic/api/user_model.dart';

class DBGenerator extends StatefulWidget {
  const DBGenerator({Key? key}) : super(key: key);

  @override
  State<DBGenerator> createState() => _DBGeneratorState();
}

class _DBGeneratorState extends State<DBGenerator> {
  static const _title = "DB Data Generator";
  static bool _remindMe = true;
  late List<UserModel>? _userModelList = [];

  static Icon _currentIcon = Icon(Icons.search);
  static var _buttonText = 'Search for available Data';

  void _getData() async {
    _userModelList = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 5)).then((value) => setState(() {}));
  }

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
      body: Center(
        child: _userModelList == null || _userModelList!.isEmpty
            ? _remindMe
                ? const Text('No Data')
                : const CircularProgressIndicator()
            : ListView.builder(
                itemCount: _userModelList!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_userModelList![index].id.toString()),
                            Text(_userModelList![index].username),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_userModelList![index].email),
                            Text(_userModelList![index].website),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 16, 168, 228),
        heroTag: "selectData",
        label: Row(
          children: [
            _currentIcon,
            const SizedBox(width: 10),
            Text(_buttonText)
          ],
        ),
        onPressed: () {
          Widget remindButton = TextButton(
            child: const Text("Remind me later"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
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
                  onPressed: (() => setState(() {
                        Navigator.of(context).pop();
                        _remindMe = false;
                        _getData();
                      })),
                  child: const Text('Got it!'),
                ),
              ],
            ),
          );
          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: const Text("Notice"),
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
