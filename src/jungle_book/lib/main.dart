import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jungle Book',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Jungle Book')),
        drawer: new AppMenu(),
        body: new MainPageManager(),
      ),
    );
  }
}

class MainPageManager extends StatefulWidget {
  @override
  _MainPageManagerState createState() => _MainPageManagerState();
}

class _MainPageManagerState extends State<MainPageManager> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Image.asset('images/flamingo.jpg',
        fit: BoxFit.cover,)
    );
  }
}


class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text('Jungle Book'),
          decoration: BoxDecoration(
              color: Colors.blue
          ),),
        new ListTile(
          title: new Text('Random Mode'),
          trailing: new Icon(Icons.autorenew),
          onTap: () => Navigator.of(context).pop(),
        ),
        new ListTile(
          title: new Text('Scene Mode'),
          trailing: new Icon(Icons.picture_in_picture),
          onTap: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
