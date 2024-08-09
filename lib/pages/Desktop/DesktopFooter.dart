import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/components/Contacts.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DesktopFooter extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    Config notifier = Provider.of<Config>(context);
  
    return VisibilityDetector(
      key: const Key('Contact'),
      onVisibilityChanged: (_){
        if (_.visibleFraction > 0.25){
         notifier.set_section_visible('Contact');
         notifier.set_visited('Contact');
        }else{
          notifier.remove_section('Contact');
        }
         },
      child: BottomAppBar(
        height: Globals.width! / Globals.width_80,
        color: AppColors.primary_purple,
        padding: const EdgeInsets.symmetric(horizontal: Globals.Padding,),
        elevation: 0,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[ 
              Contacts(),
              const Spacer(),
              Text('©️ Parth Vij 2024. All rights reserved', style: TextStyle(fontSize: Globals.width! / Globals.size_16, color: AppColors.diffWhite), textAlign: TextAlign.center,), 
              const Spacer(),
            ]
          ),
        ),
      ),
    );
  }
}