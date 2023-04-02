import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class A extends StatefulWidget {
  const A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  bool buttonState = true;

  void _buttonChange() {
    setState(() {
      buttonState = !buttonState;
      print(buttonState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Button State'),
        ),
        body: Center(
            child: Wrap(
              children: <Widget>[
                Container(
                child: buttonState == true ?
            MaterialButton(
            onPressed: buttonState ? _buttonChange : null,
              child: Text("button1"),
              color: Colors.red,
            )
            : MaterialButton(
                onPressed: buttonState ? null : _buttonChange,
                child: Text("button2"),
                color: Colors.greenAccent,
              )
              ),
                Container(
                    child: buttonState == true ?
                    MaterialButton(
                      onPressed: buttonState ? _buttonChange : null,
                      child: Text("button1"),
                      color: Colors.red,
                    )
                        : MaterialButton(
                      onPressed: buttonState ? null : _buttonChange,
                      child: Text("button2"),
                      color: Colors.greenAccent,
                    )
                )
              ],
            )));
  }
}

