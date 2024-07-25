import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';

class NavigationText extends StatelessWidget{
  final ScrollController? controller;
  final String text;
  final int index;
  final double? position;

  const NavigationText(this.text, this.index, {this.position, this.controller, super.key});

  void scrollTo(double? position){
    if (position != null){
    controller!.animateTo(position, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context){
    Config notifier = Provider.of<Config>(context);
    return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: notifier.section_visble.last != text ?  [
                    MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (event) {
              notifier.set_hovered_nav(index);
            },
            onExit: (event) {
              notifier.set_hovered_nav(-1);
            },
            child: GestureDetector(
              onTap: () => scrollTo(position!),
              child: Container(
                margin: EdgeInsets.all(Globals.width! / Globals.width_10),
                child: Text(
                      text,
                      style: TextStyle(
                        fontSize: Globals.width! / Globals.size_20,
                        color: notifier.hovered_nav == index ? const Color.fromARGB(255, 226, 154, 255) : AppColors.black,
                      ),
                    ),)))
                  ] : [
                    MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (event) {
              notifier.set_hovered_nav(index);
            },
            onExit: (event) {
              notifier.set_hovered_nav(-1);
            },
            child: GestureDetector(
              onTap: () => scrollTo(position!),
              child: Container(
                margin: EdgeInsets.all(Globals.width! / Globals.width_10),
                child: Text(
                      text,
                      style: TextStyle(
                        fontSize: Globals.width! / Globals.size_20,
                        color: notifier.hovered_nav == index ? const Color.fromARGB(255, 226, 154, 255) : AppColors.black,
                      ),
                    ),))),
                    Container( 
                      width: Globals.width! / Globals.size_12,
                      height: Globals.width! / Globals.size_12,
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(255, 226, 154, 255),
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                    )
                  ],
                ); 
  }
}