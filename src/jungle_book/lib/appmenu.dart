import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text('Jungle Book'),
          decoration: BoxDecoration(
              color: Colors.blue,
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