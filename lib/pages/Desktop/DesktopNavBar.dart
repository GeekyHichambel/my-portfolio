import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/components/NavigationText.dart';

class DesktopNavBar extends StatelessWidget{
  final ScrollController? controller;

  const DesktopNavBar({super.key, this.controller});


  @override
  Widget build(BuildContext context){
    List links = [
      ['Home', 0],
      ['About', 600],
      ['Projects', 0],
      ['Reviews', 0],
      ['Contact', 1400],
    ];

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          decoration: BoxDecoration(color: AppColors.white.withOpacity(0.45)),
        ),
        ),),
      titleSpacing: 100.0,
      centerTitle: true,   
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Parth Vij', style: TextStyle(fontSize: 20, color: AppColors.black), textAlign: TextAlign.center,),
          const Spacer(flex: 5,),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [for (List link in links) NavigationText(link[0], links.indexOf(link), position: link[1], controller: controller,),]
          ),
          const Spacer(flex: 6,)
        ],
      ),
    );
  }
}