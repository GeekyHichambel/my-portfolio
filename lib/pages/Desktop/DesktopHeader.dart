import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DesktopHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.maxFinite,
      height: 500,
      child: Lottie.asset(
        'assets/hello_animation.json',
        backgroundLoading: true,
        fit: BoxFit.fill,
        repeat: false,
      ),
    );
  }
}