import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';

class Achievements extends StatelessWidget{
  final bool isMobile;
  final List achievements = [
    
  ];

  Achievements({this.isMobile = false,super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      child: achievements.isEmpty ?Center(
        child: Text('Nothing much to display',
                                            style: TextStyle(
                                              fontSize: isMobile? Globals.width! / Globals.width_30*2 : Globals.width! / Globals.size_20,
                                              color: AppColors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
      ) : Column(
                                          children: [
                                            for (var achievement in achievements) ListTile(
              leading: Icon(achievements[achievements.indexOf(achievement)].icon, color: AppColors.tertiary_purple,),
              title:  Text(achievements[achievements.indexOf(achievement)].label,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                              ),
            )
                                          ],
                                        ),
    );
  }
}