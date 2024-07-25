import 'package:flutter/material.dart';

class Globals{

static const String sysFont = 'CsDamon'; 
static ScrollController scrollController = ScrollController();
static double? width;
static double? height; 
static const SectionSpacing = 50.0;
static const Padding = 80.0;
static const double size_32 = 52.5;
static const double size_24 = 70;
static const double size_20 = 84;
static const double size_16 = 105;
static const double size_12 = 140;
static const double width_5 = 336;
static const double width_10 = 168;
static const double width_30 = 56;
static const double width_40 = 42;
static const double width_80 = 21;
static const double width_100 = 16.8;
static const double width_200 = 8.4;
static const double width_300 = 5.6;
static const double width_350 = 4.8;
static const double width_400 = 4.2;
static const double width_500 = 3.36;
static const double height_10 = 105;
static const double height_20 = 52.5;
static const double height_30 = 35;
static const double height_50 = 21;
static const double height_40 = 26.25;
static const double height_100 = 10.5;
static const double height_200 = 5.25;
static const double height_250 = 4.2;
static const double height_300 = 3.5;
static const double height_400 = 2.62;
static const double height_500 = 2.1;

static dynamic checkPlatform(BuildContext context){
  width = MediaQuery.of(context).size.width;
  height = MediaQuery.of(context).size.height;
  print(width);
  if (width! < 450){
    return 'Mobile';
  }else if (width! >= 450 && width! < 800){
    return 'Tablet';
  }
  return 'Desktop';
}

}