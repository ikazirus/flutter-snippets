import 'dart:math';
import 'package:flutter/material.dart';

class UIConfigWrapper extends StatelessWidget {
  final Widget child;

  const UIConfigWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    UI.initialize(BuildContext context);
    return child;
  }
}

class UI{
  static double width = 0;
  static double height = 0;
  static double hpx = 0;
  static double wpx = 0;
  static double textScale = 0;
  static double ratio = 0;
  static bool isLandscape = false;

  static void initialize(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    hpx = height * MediaQuery.of(context).devicePixelRatio;
    wpx = width * MediaQuery.of(context).devicePixelRatio;
    isLandscape = height < width;

    //Designed for iPhone 12 Pro Max
    double _uiValue = pow((pow(width, 2) + pow(height, 2)), 0.5);
    ratio = _uiValue / 1024;    

    print("W=$width wpx=$wpx \nH=$height hpx=$hpx \n\nUI_Value= $_uiValue \nRatio = $ratio");
  }
}
