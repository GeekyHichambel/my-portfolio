import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';

class CarouselItem{
  String? about;
  List<IconData>? tech;
  Image? image;
  String title;


  CarouselItem({required this.title, this.about, this.tech, this.image});
}

class Carousel extends StatelessWidget{
  final CarouselItem item;
  final int index;
  const Carousel({super.key,required this.item, required this.index});

  @override
  Widget build(BuildContext context){

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 50.0,
            sigmaY: 50.0,  
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
               borderRadius: BorderRadius.all(Radius.circular(16.0)),),
          ),
        ),),
        Material(
          type: MaterialType.card,
          elevation: 2.0,
          color: AppColors.diffWhite.withOpacity(0.45),
          shadowColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(Globals.width! / Globals.size_20),
            margin: EdgeInsets.all(Globals.width! / Globals.size_20),
            height: Globals.width! / Globals.height_300,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                color: AppColors.primary_purple,
                blurRadius: 10.0,
                )],
                color: AppColors.diffWhite.withOpacity(0.45),
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              ),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.magical_pink,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(child: Text(item.title, 
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Globals.width! / Globals.size_16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: Globals.width! / Globals.width_5,
                      ),)),
                  ),
                ),
                SizedBox(height: Globals.width! / Globals.width_10,),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.tertiary_purple,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(child: item.image),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}