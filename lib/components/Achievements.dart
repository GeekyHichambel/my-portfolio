import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';

class Achievements extends StatelessWidget{
  final List achievements = [
    
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      child: achievements.isEmpty ?const Center(
        child: Text('Nothing much to display',
                                            style: TextStyle(
                                              fontSize: 20.0,
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