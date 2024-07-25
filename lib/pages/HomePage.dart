import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/pages/Desktop/DesktopBody.dart';
import 'package:my_portfolio/pages/Desktop/DesktopFooter.dart';
import 'package:my_portfolio/pages/Desktop/DesktopHeader.dart';
import 'package:my_portfolio/pages/Desktop/DesktopHome.dart';
import 'package:my_portfolio/pages/Mobile/MobileHome.dart';

class HomePage extends StatelessWidget{

  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
      var platform = Globals.checkPlatform(context); 
      return platform == 'Mobile'? MobileHome() : platform == 'Desktop' ? DesktopHome(
        header: DesktopHeader(controller: Globals.scrollController),
        body: const DesktopBody(),
        footer: DesktopFooter(),
      ) : SizedBox(
        width: Globals.width,
        height: Globals.height,
        child: Center(
          child: Text(
            'Kindly use a Desktop or a Mobile device',
            style: TextStyle(
              decorationThickness: 0.0,
              color: AppColors.diffWhite,
              fontSize: Globals.width! / Globals.size_32* 2,
               shadows: const [
                                      Shadow(
                                      color: AppColors.tertiary_purple,
                                      blurRadius: 10.0,  
                                    ),
                                     Shadow(
                                      color: AppColors.tertiary_purple,
                                      blurRadius: 10.0,  
                                    )
                                    ],
            ),
          ),
        ),
      );
  } 
}