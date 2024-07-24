import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DesktopHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    Config notifier = Provider.of<Config>(context);

    return SizedBox(
      width: double.maxFinite,
      height: Globals.width! / Globals.width_400,
      child: VisibilityDetector(
          key: const Key('Header'),
      onVisibilityChanged: (_) {
        if (_.visibleFraction > 0.1){
          notifier.set_section_visible('Header');
        }else{
          notifier.remove_section('Header');
        } },child: Center(
        child: GradientAnimationText(
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
                    fontSize: Globals.width! / Globals.size_32 * 6,
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
        ),));
  }
}