import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/pages/Desktop/DesktopNavBar.dart';

class DesktopHome extends StatelessWidget{
  final Widget? header;
  final  Widget? body;
  final Widget? footer;

  const DesktopHome({this.header, this.body, this.footer, super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(Globals.width! / Globals.height_30), child: DesktopNavBar(controller: Globals.scrollController)),
      body: SingleChildScrollView(
        controller: Globals.scrollController,
        child: Column(
          children: [
            const SizedBox(height: Globals.SectionSpacing,),
            header ?? const SizedBox.shrink(),
            const SizedBox(height: Globals.SectionSpacing,),
            body?? const SizedBox.shrink(),
            const SizedBox(height: Globals.SectionSpacing,),
            footer?? const SizedBox.shrink(),
          ],
        )
      ),
    );
  }
}