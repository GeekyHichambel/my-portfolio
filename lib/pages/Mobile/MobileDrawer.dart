import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';

class MobileDrawer extends StatelessWidget{
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: AppColors.diffWhite,
      width: Globals.width! * 0.4,
      elevation: 2,
      child: Column(
        children: [

        ],
      ),
    );
  }
}