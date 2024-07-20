import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/components/Tools.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';

class SkiilList extends StatelessWidget{

  SkiilList({super.key});

  final List<Tool> skills = [
    Tool(icon: Iconsax.designtools_bold, label: 'UI/UX Design'),
    Tool(icon: Iconsax.mobile_programming_bold, label: 'App Development'),
    Tool(icon: Iconsax.monitor_bold, label: 'Web Development'),
    Tool(icon: Iconsax.game_bold, label: 'Game Development'),
    Tool(icon: Iconsax.data_bold, label: 'Database Management'),
  ];


  @override
  Widget build(BuildContext context){
    Config notifier = Provider.of<Config>(context);

    return Container(
      height: 400,
      child: ScrollbarTheme(
        data: const ScrollbarThemeData(interactive: false),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: skills.length,
          itemBuilder: (context, index){
            return MouseRegion(
              onHover: (_) => notifier.set_skill_hovered(index),
              onExit: (_) => notifier.set_skill_hovered(-1),
              cursor: SystemMouseCursors.grab,
              child: notifier.hovered_skill == index ? ListTile(
                leading: Icon(skills[index].icon, color: AppColors.tertiary_purple,),
                title: Text(skills[index].label,
                style: const TextStyle(
                  color: AppColors.diffWhite,
                ), 
                ),
              ).animate(
                  effects: [
                    MoveEffect(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      begin: Offset.zero,
                      end: Offset.fromDirection(3.14, -10.0),
                    ),
                    const ScaleEffect(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      end: Offset(1.05, 1.05),
                    )
                  ]
                ) : ListTile(
                leading: Icon(skills[index].icon, color: AppColors.tertiary_purple,),
                title: Text(skills[index].label,
                style: const TextStyle(
                  color: AppColors.diffWhite,
                ), 
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}