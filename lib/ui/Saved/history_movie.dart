import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HistoryMovies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HistoryState();
}

class HistoryState extends State<HistoryMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Saved Movie \n not finished ",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
