import 'package:flutter/material.dart';
import "dart:math";
void main() => runApp(JungleBookApp());


class JungleBookApp extends StatefulWidget {
  @override
  _JungleBookAppState createState() => _JungleBookAppState();
}

class _JungleBookAppState extends State<JungleBookApp> {
  String _currentAnimal;
  List<String> _animals = ["flamingo","taucan"];
  final _random = new Random();

  @override
  void initState(){
    var randomIndex = _random.nextInt(_animals.length);
    _currentAnimal = _animals[randomIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jungle Book',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Jungle Book')),
        drawer: new AppMenu(),
        body: new DisplayPage(animal: _currentAnimal,),
        floatingActionButton: new FloatingActionButton(
          onPressed: (){
            setState(() {
              var randomIndex = _random.nextInt(_animals.length);
              _currentAnimal = _animals[randomIndex];
            });
          },
          child: new Icon(Icons.navigate_next),),
      ),
    );
  }
}



class DisplayPage extends StatelessWidget {
  final String animal;
  DisplayPage({this.animal});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Image.asset('images/$animal.jpg',
          fit: BoxFit.fill,)
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
