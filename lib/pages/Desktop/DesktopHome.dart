import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/pages/Desktop/DesktopNavBar.dart';

class DesktopHome extends StatelessWidget{
  final Widget? header;
  final  Widget? body;
  final Widget? footer;
  final ScrollController controller = ScrollController();

  DesktopHome({this.header, this.body, this.footer, super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50), child: DesktopNavBar(controller: controller)),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            const SizedBox(height: Globals.SectionSpacing,),
            header?? const SizedBox.shrink(),
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