import 'package:flutter/material.dart';
import "dart:math";
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'appmenu.dart';
import 'slideshow.dart';
import 'pathmanager.dart';
import 'BirdManager.dart';
import 'dictionary.dart';

class SlideCordinator extends StatefulWidget {
  final BaseDictionary baseDictionary;

  SlideCordinator({this.baseDictionary}):super();
  @override
  _SlideCordinatorState createState() => _SlideCordinatorState();
}

class _SlideCordinatorState extends State<SlideCordinator> {
  String _currentAnimal;
  static BirdManager _birdManager = new BirdManager();

  List<String> _animals = _birdManager.getList(3);

  final _random = new Random();
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
            play(widget.baseDictionary.getCryAudioFilePath(_currentAnimal));
          },
          child: new Icon(Icons.navigate_next),),
      ),
    );
  }
}