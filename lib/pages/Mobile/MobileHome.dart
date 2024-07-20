import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';

class MobileHome extends StatelessWidget{
  Widget? navbar;
  Widget? header;
  Widget? body;
  Widget? footer;

  MobileHome({this.navbar, this.header, this.body, this.footer, super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(200), child: navbar!),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header!,
            //body!,
            //footer!,
          ],
        )
      ),
    );
  }
}