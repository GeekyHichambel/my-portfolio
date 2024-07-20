import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/colors.dart';
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
    return MouseRegion(
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
          margin: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: notifier.hovered_nav == index ? const Color.fromARGB(255, 226, 154, 255) : AppColors.black,
            ),
          ),
        ),
      ),
    ); 
  }
}