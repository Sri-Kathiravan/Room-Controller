import 'dart:ui';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class HomeItemsDm {
  AssetImage image;
  String title;
  int noOfBulb;

  HomeItemsDm(this.image, this.title, this.noOfBulb);
}

class LightDm {
  AssetImage image;
  AssetImage selectedImage;
  String title;

  LightDm(this.title, this.image, this.selectedImage);
}

class SceneDm {
  String title;
  Color startColor;
  Color endColor;

  SceneDm(this.title, this.startColor, this.endColor);


}

class ColorDM {
  Color mainColor;
  List<Color> shades;

  ColorDM(this.mainColor, this.shades);

}