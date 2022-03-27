import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String? debugPrintText;
  final String buttonText;

  const OutlinedButtonWidget(
      {Key? key, this.debugPrintText, this.buttonText = "Button to Press"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        debugPrint(debugPrintText);
      },
      child: Text(buttonText),
    );
  }
}
