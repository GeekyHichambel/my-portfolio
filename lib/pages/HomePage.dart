import 'package:flutter/material.dart';
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
      return platform == 'Mobile'? MobileHome() : DesktopHome(
        header: DesktopHeader(),
        body: const DesktopBody(),
        footer: DesktopFooter(),
      );
  } 
}