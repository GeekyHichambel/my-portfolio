import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/pages/Mobile/MobileDrawer.dart';
import 'package:my_portfolio/pages/Mobile/MobileNavBar.dart';

class MobileHome extends StatelessWidget{
  final Widget? header;
  final Widget? body;
  final Widget? footer;

  const MobileHome({this.header, this.body, this.footer, super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: const MobileDrawer(),
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(preferredSize: Size.fromHeight(Globals.width! / Globals.height_100 * 1.5), child: const MobileNavBar()),
      body: SingleChildScrollView(
        controller: Globals.scrollController,
        child: Column(
          children: [
            header!,
            body!,
            //footer!,
          ],
        )
      ),
    );
  }
}