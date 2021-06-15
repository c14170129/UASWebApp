import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  String textButton;
  final GestureTapCallback pressButton;

  @override
  _MyButtonState createState() =>
      _MyButtonState(this.textButton, pressButton: pressButton);
  MyButton(this.textButton, {required this.pressButton});
}

class _MyButtonState extends State<MyButton> {
  String textButton;
  final GestureTapCallback pressButton;

  _MyButtonState(this.textButton, {required this.pressButton});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: Colors.red, onPrimary: Colors.white),
          icon: Icon(Icons.account_box_outlined),
          label: Text(
            textButton,
          ),
          onPressed: pressButton,
        )
      ],
    );
  }
}
