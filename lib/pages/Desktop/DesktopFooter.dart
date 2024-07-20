import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/components/Contacts.dart';
import 'package:my_portfolio/globals.dart';

class DesktopFooter extends StatelessWidget{

  @override
  Widget build(BuildContext context){
  
    return BottomAppBar(
      color: AppColors.primary_purple,
      padding: const EdgeInsets.symmetric(horizontal: Globals.Padding,),
      elevation: 0,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[ 
            Contacts(),
            const Spacer(),
            const Text('©️ Parth Vij 2024. All rights reserved', style: TextStyle(fontSize: 12, color: AppColors.diffWhite), textAlign: TextAlign.center,), 
            const Spacer(),
          ]
        ),
      ),
    );
  }
}