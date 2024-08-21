import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';

class AbtCard extends StatelessWidget{

  final Widget? child;
  final Color? color;

  const AbtCard({this.child, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Globals.width! * 0.6,
        height: Globals.height! * 0.5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: const [
            BoxShadow(
              color: AppColors.white,
              blurRadius: 1.0,
              blurStyle: BlurStyle.outer,
            )
          ]
          ),
        child: child,
      );
  }
}