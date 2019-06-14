import 'package:flutter/material.dart';

void main() => runApp(MainApplication());

class MainApplication extends StatefulWidget {
  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jungle Book',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Jungle Book')),
        drawer: new ListView(
          children: <Widget>[
            DrawerHeader(
                child: Text('Jungle Book'),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),),
            new ListTile(
              title: new Text('Random Mode'),
              trailing: new Icon(Icons.autorenew),
            ),
            new ListTile(
              title: new Text('Scene Mode'),
              trailing: new Icon(Icons.picture_in_picture),
            )
          ],
        ),
      ),
    );
  }
}
