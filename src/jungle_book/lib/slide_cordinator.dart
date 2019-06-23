import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'appmenu.dart';
import 'slideshow.dart';
import 'dictionary.dart';

class SlideCordinator extends StatefulWidget {
  final BaseDictionary baseDictionary;
  List<String> _animalList;
  SlideCordinator({this.baseDictionary}):super(){
    print(this.baseDictionary.getName());
    _animalList = this.baseDictionary.getList();
    print(_animalList.length);
  }
  @override
  _SlideCordinatorState createState() => _SlideCordinatorState();
}

class _SlideCordinatorState extends State<SlideCordinator> {
  String _currentAnimal;
  int currentIndex = 1;
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
    _currentAnimal = widget._animalList[currentIndex];
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
              currentIndex+=1;
              _currentAnimal = widget._animalList.elementAt(currentIndex);
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