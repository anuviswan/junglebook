import 'package:flutter/material.dart';

class Hint  extends StatelessWidget {
  final String faunaName;
  final String interestingFact;
  Hint.loadFauna({this.faunaName,this.interestingFact}):super();

  @override
  Widget build(BuildContext context) {
    return new IconButton(icon: new Icon(Icons.help_outline), onPressed: (){
      final snackBar = SnackBar(content: Text('Name: $faunaName\nInteresting Fact: $interestingFact'));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }
}