import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';

class MobileNavBar extends StatelessWidget{

  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Config notifier = Provider.of<Config>(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Container(
          decoration: BoxDecoration(color: AppColors.white.withOpacity(0.45)),
        ),
        ),),
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: Globals.width! / Globals.width_40),
        child: Text(
          notifier.section_visble.isNotEmpty ? notifier.section_visble.last == 'Home' ? 'Parth Vij' : notifier.section_visble.last : 'Home',
          style: TextStyle(
            fontFamily: Globals.sysFont,
            fontSize: Globals.width! / Globals.width_100 * 1.5,
            color: AppColors.tertiary_purple,
          ),
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(top: Globals.width! / Globals.width_40),
        child: DrawerButton(
          color: AppColors.black,
          onPressed: ()=>{
            Scaffold.of(context).openDrawer()
          },
        ),
      ),
    );
  }
}