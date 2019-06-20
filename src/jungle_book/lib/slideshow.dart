import 'package:flutter/material.dart';
import 'pathmanager.dart';

class SlideShow extends StatelessWidget {
  final String animal;
  final PathManager _pathManager = new PathManager();
  SlideShow({this.animal});

  @override
  Widget build(BuildContext context) {
    return new Image.asset(_pathManager.GetImagePath(animal),
      fit: BoxFit.cover,
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
    );
  }
}