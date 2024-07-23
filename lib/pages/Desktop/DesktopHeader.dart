import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/globals.dart';

class DesktopHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.maxFinite,
      height: Globals.height! / 2.1,
      child: Lottie.asset(
        'assets/hello_animation.json',
        backgroundLoading: true,
        fit: BoxFit.fill,
        repeat: false,
      ),
    );
  }
}