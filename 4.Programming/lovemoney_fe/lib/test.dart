import 'package:flutter/material.dart';

class TFChange extends StatefulWidget {

  final String title = "TextField Demo";

  @override
  _TFChangeChange createState() => _TFChangeChange();

}

class _TFChangeChange extends State<TFChange> {

  final myController = TextEditingController();

  textListener() {
    print("Current Text is ${myController.text}");
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(textListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                print("Text $text");
              },
            ),
            TextField(
              controller: myController,
            )
          ],
        ),
      ),
    );
  }

}