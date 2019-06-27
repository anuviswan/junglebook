import 'package:flutter/material.dart';
import 'pathmanager.dart';
import 'dictionary.dart';

class SlideShow extends StatelessWidget {
  final String animalPath;
  final BaseDictionary _dictionary = new BirdsLocalDictionary();
  SlideShow({this.animalPath});

  @override
  Widget build(BuildContext context) {
    print('animal = ${this.animalPath}');
    return new Image.asset(this.animalPath,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
    );
  }
}