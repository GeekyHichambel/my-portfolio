import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MobileHeader extends StatelessWidget{
  final ScrollController controller;

  const MobileHeader({required this.controller, super.key});


  @override
  Widget build(BuildContext context){
    Config notifier = Provider.of<Config>(context);

    return SizedBox(
      width: Globals.width,
      height: Globals.height,
      child: VisibilityDetector(
          key: const Key('Home'),
      onVisibilityChanged: (_) {
        if (_.visibleFraction > 0.25){
          notifier.set_section_visible('Home');
          notifier.set_visited('Home');
        }else{
          notifier.remove_section('Home');
        } },child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientAnimationText(
                duration:const Duration(milliseconds: 1500),
                colors: [
                  AppColors.primary_purple.withOpacity(0.7),
                  AppColors.tertiary_purple.withOpacity(0.7),
                  AppColors.secondary_purple.withOpacity(0.7),
                ],
                text: Text(
                                  'Hi Fellas!',
                                  style: TextStyle(
                        color: AppColors.diffWhite,
                        fontWeight: FontWeight.w500,
                        fontFamily: Globals.sysFont,
                        fontSize: Globals.width! / Globals.width_400,
                                  ),
                                ),
                      ).animate(
                        effects: const [
                          FadeEffect(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeIn,
                            begin: 0.0,
                            end: 1.0,
                          )
                        ]
                      ),
                      SizedBox(height: Globals.width! / Globals.width_40),
                      RippleAnimation(
                        color: AppColors.tertiary_purple.withOpacity(0.5),
                        delay: const Duration(seconds: 1),
                        duration: const Duration(milliseconds: 1800),
                        repeat: true,
                        ripplesCount: 3,
                        minRadius: Globals.width! / Globals.width_100,
                        child: IconButton(onPressed: (){
                            controller.animateTo(Globals.height! + 50, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                          }, icon: Icon(Iconsax.arrow_down_1_outline, color: AppColors.dark_purple, size: Globals.width! / Globals.width_200)),
                      )
          ],
        ),
        ),));
  }
}