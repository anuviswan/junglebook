import 'package:flutter/material.dart';
import 'pathmanager.dart';
import 'dictionary.dart';

class SlideShow extends StatelessWidget {
  final String animal;
  final BaseDictionary _dictionary = new BirdsLocalDictionary();
  SlideShow({this.animal});

  @override
  Widget build(BuildContext context) {
    return new Image.asset(_dictionary.getImageFilePath(animal),
      fit: BoxFit.cover,
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
    );
  }
}