import 'package:flutter/material.dart';
import 'package:my_portfolio/components/BentoGrid.dart';
import 'package:my_portfolio/components/ProjectView.dart';
import 'package:my_portfolio/components/Review.dart';

class DesktopBody extends StatelessWidget{
  const DesktopBody({super.key});


  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Bentogrid(),
        ProjectView(),
        ReveiwShowcase(),
      ],
    );
  }

}