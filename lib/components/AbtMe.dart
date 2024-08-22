import 'package:draggable_carousel_slider/draggable_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_moving_background/enums/animation_types.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/components/AbtCard.dart';
import 'package:my_portfolio/components/Achievements.dart';
import 'package:my_portfolio/components/ContactInfo.dart';
import 'package:my_portfolio/components/Projects.dart';
import 'package:my_portfolio/components/Tools.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AbtMe extends StatelessWidget {

  AbtMe({super.key});

  final List<Tool> skills = [
    Tool(icon: Iconsax.designtools_bold, label: 'UI/UX Design'),
    Tool(icon: Iconsax.mobile_programming_bold, label: 'App Development'),
    Tool(icon: Iconsax.monitor_bold, label: 'Web Development'),
    Tool(icon: Iconsax.game_bold, label: 'Game Development'),
    Tool(icon: Iconsax.data_bold, label: 'Database Management'),
  ];

  @override
  Widget build(BuildContext context) {
    Config notifier = Provider.of<Config>(context);

    final List<AbtCard> cards = [
    AbtCard(
      color: AppColors.tertiary_purple,
      child: Padding(
        padding: EdgeInsets.all(Globals.width! / Globals.width_80),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: CircleAvatar(
                radius: Globals.width! / Globals.width_400,
                backgroundColor: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.all(Globals.width! / Globals.width_30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Globals.width! / Globals.width_400),
                    child: Image.asset(
                      'assets/myPic.jpg',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TypeWriter.text(
                'Myself Parth Vij,\nI am a CSE student.',
                repeat: false,
                enabled: true,
                style: TextStyle(color: AppColors.white, fontSize: Globals.width! / Globals.width_80),
                textAlign: TextAlign.center,
                duration: const Duration(milliseconds: 100),
              ),
            ),
          ],
        ),
      ),
    ),
    AbtCard(
      color: AppColors.primary_purple,
      child: Padding(
        padding: EdgeInsets.all(Globals.width! / Globals.width_80),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
             Expanded(
              flex: 1,
               child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                              Text('What I can do?',
                                    style: TextStyle(
                                    fontSize: Globals.width! / Globals.width_80,
                                    color: AppColors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  ),
                                SizedBox(width: Globals.width! / Globals.width_30,),
                                Icon(Icons.engineering_rounded, color: AppColors.white,
                                    size: Globals.width! /Globals.width_80,
                                    shadows: const [
                                            Shadow(
                                            color: AppColors.white,
                                            blurRadius: 10.0,  
                                          ),
                                           Shadow(
                                            color: AppColors.white,
                                            blurRadius: 10.0,  
                                          )
                                          ],
                                        )
                                      ],
                           ),
             ),
            Expanded(
              flex: 6,
              child: ListView.builder(physics: const NeverScrollableScrollPhysics(),itemCount: skills.length, itemBuilder: (context, index){
                return ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: Globals.width! / Globals.width_30,
                minTileHeight: Globals.width! / Globals.width_80,
                  leading: Icon(skills[index].icon, color: AppColors.tertiary_purple, size: Globals.width!/Globals.width_80,),
                  title: Text(skills[index].label,
                  style: TextStyle(
                    fontSize: Globals.width! / Globals.width_30 * 2,
                    color: AppColors.diffWhite,
                  ), 
                  ),
                );
              }),
            )
          ],
        ),
      )
    ),
     AbtCard(
      color: AppColors.secondary_purple,
      child: Padding(
        padding: EdgeInsets.all(Globals.width! / Globals.width_80),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text('My Skills',
                style: TextStyle(
                  fontSize: Globals.width! / Globals.width_80,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
                         SizedBox(width: Globals.width! / Globals.width_30,),
              Icon(Bootstrap.gear_wide, color: AppColors.white, size: Globals.width! / Globals.width_80,).animate(
                effects: [
                  const RotateEffect(
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    begin: 0.0,
                    end: 1.0,
                  ),
                ],
                autoPlay: true,
                onComplete: (_) => _.repeat(),
              ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 12,
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                                  Expanded(flex: 1,child: Languages(isMobile: true,)),
                                  Expanded(flex: 1, child: Frameworks(isMobile: true)),
                                  Expanded(flex: 1, child: Tools(isMobile: true)),
                                ],
                    )
            )
          ],
        ),
      )
    ),
     AbtCard(
      color: AppColors.tertiary_purple,
      child: Padding(
        padding: EdgeInsets.all(Globals.width! / Globals.width_80),
        child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                                Expanded(
                                  child: ClipRect(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Text('My Achievements',
                                            style: TextStyle(
                                            fontSize: Globals.width! / Globals.width_80,
                                            color: AppColors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          ),
                                          SizedBox(height: Globals.width! / Globals.width_30,),
                                          Icon(IonIcons.trophy, color: AppColors.white, size: Globals.width! / Globals.width_10*6,)
                                        ],
                                      ).animate(
                                        onComplete: (_) => _.repeat(),
                                        effects: [
                                          const SlideEffect(
                                            duration: Duration(milliseconds: 3600),
                                            curve: Curves.easeInOut,
                                            begin: Offset(0.0, 1.0),
                                            end: Offset(0.0, -1.0)
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 3, child: Achievements(isMobile: true)),
          ],
        )
      )
    ),
     AbtCard(
      color: AppColors.secondary_purple,
      child: Padding(
        padding: EdgeInsets.all(Globals.width! / Globals.width_80),
        child: Column( mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Top Projects',
                                          style: TextStyle(
                                            fontSize: Globals.width! / Globals.width_80,
                                            color: AppColors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(width: Globals.width! / Globals.width_30,),
                                        const Icon(LineAwesome.project_diagram_solid, color: AppColors.white,).animate(
                                          effects: [
                                            const ShakeEffect(
                                              duration: Duration(seconds: 2),
                                              curve: Curves.decelerate,
                                              rotation: 2.0,
                                              hz: 0.5,
                                            ),
                                          ],
                                          autoPlay: true,
                                          onComplete: (_) => _.repeat(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: Globals.width! / Globals.width_30,),
                                  const Expanded(flex: 4,child: Projects(isMobile: true)),
                                ],
                              )
      )
    ),
    AbtCard(
      color: AppColors.primary_purple,
      child: Padding(
        padding: EdgeInsets.all(Globals.width! / Globals.width_80),
        child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('Get in Touch',
                                            style: TextStyle(
                                              fontSize: Globals.width! / Globals.width_80,
                                              color: AppColors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(width: Globals.width! / Globals.width_30,),
                                          Icon(Clarity.cursor_hand_click_line, color: AppColors.diffWhite,
                                            size: Globals.width! / Globals.width_80,
                                            shadows: const [
                                              Shadow(
                                                color: AppColors.white,
                                                blurRadius: 10.0,  
                                              ),
                                               Shadow(
                                                color: AppColors.white,
                                                blurRadius: 10.0,  
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Globals.width! / Globals.size_16,),
                                    Expanded(flex:4,child: ContactInfo(isMobile: true))
                                  ],
                                )
      )
    ),
  ];

    return VisibilityDetector(
      key: const Key('About'),
      onVisibilityChanged: (_) {
        if (_.visibleFraction > 0.25){
          notifier.set_section_visible('About');
          notifier.set_visited('About');
        }else{
          notifier.remove_section('About');
        }
        print(notifier.section_visble);
        print(notifier.sections_visited);
      },
      child:  ClipRect(
        child: MovingBackground(
          animationType: AnimationType.rain,
          backgroundColor: AppColors.diffWhite,
          circles: const [
            MovingCircle(color: AppColors.primary_purple, radius: 500, blurSigma: 20,),
            MovingCircle(color: AppColors.tertiary_purple, radius: 500,blurSigma: 20,),
            MovingCircle(color: AppColors.secondary_purple, radius: 500,blurSigma: 20,),
          ],
          child: SizedBox(
                width: Globals.width,
                height: Globals.height! * 0.75,
                child: Center(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Globals.width! / Globals.width_30),
                  child: DraggableSlider(children: cards),
                )),
                )
              )
            )
          );
}
}