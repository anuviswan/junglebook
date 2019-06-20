import 'package:flutter/material.dart';
import "dart:math";
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'appmenu.dart';
import 'slideshow.dart';
import 'pathmanager.dart';
import 'BirdManager.dart';
import 'slidecordinator.dart';

void main() => runApp(MaterialApp(home:new HomePage()));



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Jungle Book'),),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          new Card(
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: 150.0,
                  child: new Stack(
                    children: <Widget>[
                      Positioned.fill(child: Image.asset('images/graphics/birds_card.jpg',fit: BoxFit.cover,)),
                      Positioned(
                        bottom: 16.0,
                        left:16.0,
                        right:16.0,
                        child: new FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: new Text('Winged Wonders',style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                    
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text("Learn more on Winged Wonders"),
                      new FlatButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => new SlideCordinator()),
                        );
                      },  child: new Text('Start Tour'))
                    ],
                  ),
                )
              ],
            ),
          ),

      new Card(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 150.0,
            child: new Stack(
              children: <Widget>[
                Positioned.fill(child: Image.asset('images/graphics/animals_card.jpg',fit: BoxFit.cover,)),
                Positioned(
                  bottom: 16.0,
                  left:16.0,
                  right:16.0,
                  child: new FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: new Text('Animal Kingdom.',style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),),
                  ),
                )
              ],
            ),

          ),
          ButtonTheme.bar(
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text("Learn more on Animal world"),
                new FlatButton(onPressed: (){}, child: new Text('Start Tour'))
              ],
            ),
          )
        ],
      ),
    )
        ],
      )
    );
      /*new Center(child: new RaisedButton(child: new Text('Take Tour'), onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute()),
        );
      },),),
    );*/
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}



class JungleBookApp extends StatefulWidget {
  @override
  _JungleBookAppState createState() => _JungleBookAppState();
}

class _JungleBookAppState extends State<JungleBookApp> {
  String _currentAnimal;
  static BirdManager _birdManager = new BirdManager();
  
  List<String> _animals = _birdManager.getList(3);

  final _random = new Random();
  final PathManager _pathManager = new PathManager();
  static AudioPlayer audioPlayer = new AudioPlayer();
  static AudioCache audioCache = new AudioCache(fixedPlayer: audioPlayer);

  Future<void> play(url) async {
    audioCache.play(url);
  }

  Future<void> stop() async{
    var result = await audioPlayer.stop();
  }

  @override
  void initState()
  {
    var randomIndex = _random.nextInt(_animals.length);
    _currentAnimal = _animals[randomIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jungle Book',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Jungle Book'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.mic), onPressed: (){})
          ],
        ),
        drawer: new AppMenu(),
        body: new GestureDetector(
          child: new SlideShow(animal: _currentAnimal),
          onHorizontalDragEnd: (DragEndDetails details){
            stop();
            setState(() {
              var currentChoice = _currentAnimal;
              while(currentChoice== _currentAnimal)
              {
                var randomIndex = _random.nextInt(_animals.length);
                _currentAnimal = _animals[randomIndex];
              }

              print(_currentAnimal);
            });
          },
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: (){
            play(_pathManager.GetBirdCryPath(_currentAnimal));
          },
          child: new Icon(Icons.navigate_next),),
      ),
    );
  }
}






