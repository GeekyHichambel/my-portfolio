import 'package:flutter/material.dart';

class Globals{

static const SectionSpacing = 50.0;
static const Padding = 80.0;

static dynamic checkPlatform(BuildContext context){
  var width = MediaQuery.of(context).size.width;
  print(width);
  if (width <= 414){
    return 'Mobile';
  }
  return 'Desktop';
}

}