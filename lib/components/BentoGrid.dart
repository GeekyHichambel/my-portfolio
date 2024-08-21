import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_moving_background/enums/animation_types.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/components/Achievements.dart';
import 'package:my_portfolio/components/BentoContainers.dart';
import 'package:my_portfolio/components/ContactInfo.dart';
import 'package:my_portfolio/components/Projects.dart';
import 'package:my_portfolio/components/SkillList.dart';
import 'package:my_portfolio/components/Tools.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Bentogrid extends StatefulWidget{
  const Bentogrid({super.key});


  @override
  BentoGridState createState() => BentoGridState();
}

class BentoGridState extends State<Bentogrid>{
  final String text = 'Myself Parth Vij,\nI am a CSE student.';
  bool enabled = true;
  bool repeat = false;
  final ScrollController controller = ScrollController();

  @override
  void initState(){
    super.initState();
  }

  void scrollDown(){
    controller.animateTo(controller.position.maxScrollExtent,
     duration: const Duration(milliseconds: 500), 
     curve: Curves.easeOut);
  }

  void scrollUp(){
    controller.animateTo(controller.position.minScrollExtent,
     duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context){

     Config notifier = Provider.of<Config>(context);

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
          animationType: AnimationType.translation,
          backgroundColor: AppColors.diffWhite,
          circles: const [
            MovingCircle(color: AppColors.primary_purple),
            MovingCircle(color: AppColors.tertiary_purple),
            MovingCircle(color: AppColors.secondary_purple),
            MovingCircle(color: AppColors.primary_purple),
            MovingCircle(color: AppColors.tertiary_purple),
            MovingCircle(color: AppColors.secondary_purple),
          ],
          child: Container(
                width: Globals.width,
                padding: const EdgeInsets.all(Globals.Padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 8,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: [
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 1,
                          child: SizedBox.shrink(),
                          ),
                          StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 3,
                          child: BentoContainers(color: AppColors.primary_purple, index: 3,
                          child: Padding(padding: EdgeInsets.all(Globals.width! / Globals.size_20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('What I can do?',
                                        style: TextStyle(
                                          fontSize: Globals.width! / Globals.size_32,
                                          color: AppColors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(width: Globals.width! / Globals.width_10,),
                                      Icon(Icons.engineering_rounded, color: AppColors.white,
                                      size: Globals.width! /Globals.size_32,
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
                                  SizedBox(height: Globals.width! / Globals.size_12,),
                                  SkiilList(),
                                ]
                              )
                            ),
                          ),
                          ),
                          StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: BentoContainers(
                            color: AppColors.secondary_purple,
                            index: 1,
                            child: Padding(padding: EdgeInsets.all(Globals.width! / Globals.size_20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Top Projects',
                                        style: TextStyle(
                                          fontSize: Globals.width! / Globals.size_32,
                                          color: AppColors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(width: Globals.width! / Globals.width_10,),
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
                                  SizedBox(height: Globals.height! / Globals.height_20,),
                                  const Spacer(),
                                  const Projects(),
                                  const Spacer(),
                                ],
                              )
                            )
                            ),
                          ),
                          StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: BentoContainers(color: AppColors.tertiary_purple,index: 2,
                            child: Padding(padding: EdgeInsets.all(Globals.width! / Globals.size_20),
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
                                                fontSize: Globals.width! / Globals.size_32,
                                                color: AppColors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(height: Globals.width! / Globals.width_5,),
                                          Expanded(child: Icon(IonIcons.trophy, color: AppColors.white, size: Globals.width! / Globals.size_24,))
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
                                  Expanded(flex: 3, child: Achievements()),
                                ],
                              )
                            ),
                          ),
                          ),
                          StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 3,
                          child: BentoContainers(color: AppColors.tertiary_purple,
                              index: 4,
                              child: Padding(
                                padding: EdgeInsets.all(Globals.width! / Globals.size_20),
                                child:  ScrollbarTheme(
                                  data: ScrollbarThemeData(
                                    thumbVisibility: WidgetStateProperty.all(false),
                                    trackVisibility: WidgetStateProperty.all(false),
                                    thickness: WidgetStateProperty.all(0.0),
                                    interactive: false
                                  ),
                                  child: SingleChildScrollView(
                                    controller: controller,
                                    physics: const NeverScrollableScrollPhysics(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: Globals.width! / Globals.width_300,
                                          width: double.infinity,
                                          child: CircleAvatar(
                                            radius: 50.0,
                                            backgroundColor: AppColors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(200.0),
                                                child: Image.asset(
                                                  'assets/myPic.jpg',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: Globals.width! / Globals.width_40,),
                                        Center(
                                          child: SizedBox(
                                            height: Globals.width! / Globals.width_80,
                                            width: double.infinity,
                                            child: TypeWriter.text(
                                              'Myself Parth Vij,\nI am a CSE student.',
                                              repeat: repeat,
                                              enabled: enabled,
                                              style: TextStyle(color: AppColors.white, fontSize: Globals.width! / Globals.size_32),
                                              textAlign: TextAlign.center,
                                              duration: const Duration(milliseconds: 100),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: Globals.width! / Globals.width_30,),
                                        MouseRegion(
                                          onHover: (_) => notifier.set_know_more(true),
                                          onExit: (_) => notifier.set_know_more(false),
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: scrollDown,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const Icon(Bootstrap.three_dots, color: AppColors.white),
                                                SizedBox(width: Globals.width! / Globals.width_10),
                                                Text(
                                                  'Know More',
                                                  style: TextStyle(
                                                    fontSize: Globals.width! / Globals.size_16,
                                                    color: AppColors.white,
                                                    shadows: notifier.know_more
                                                        ? [
                                                            const Shadow(
                                                              color: AppColors.white,
                                                              blurRadius: 10.0,
                                                            ),
                                                            const Shadow(
                                                              color: AppColors.white,
                                                              blurRadius: 10.0,
                                                            ),
                                                          ]
                                                        : [],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: Globals.width! / Globals.width_500,
                                          child: Center(
                                            child: Text('Bro, just scroll up, don\'t get personal.',
                                            style: TextStyle(
                                                    fontSize: Globals.width! / Globals.size_16,
                                                    color: AppColors.white,)
                                            ),
                                          ),
                                        ),
                                        MouseRegion(
                                          onHover: (_) => notifier.set_collapse(true),
                                          onExit: (_) => notifier.set_collapse(false),
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: ()=> scrollUp(),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                const Icon(Bootstrap.arrow_90deg_up, color: AppColors.white),
                                                SizedBox(width: Globals.width! / Globals.width_10),
                                                Text(
                                                  'Know Less',
                                                  style: TextStyle(
                                                    fontSize: Globals.width! / Globals.size_16,
                                                    color: AppColors.white,
                                                    shadows: notifier.collapse
                                                        ? [
                                                            const Shadow(
                                                              color: AppColors.white,
                                                              blurRadius: 10.0,
                                                            ),
                                                            const Shadow(
                                                              color: AppColors.white,
                                                              blurRadius: 10.0,
                                                            ),
                                                          ]
                                                        : [],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 2,
                          child: BentoContainers(color: AppColors.secondary_purple, index: 5,
                            child:Padding(padding: EdgeInsets.all(Globals.width! / Globals.size_20),
                              child:  Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('My Skills',
                                        style: TextStyle(
                                          fontSize: Globals.width! / Globals.size_32,
                                          color: AppColors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(width: Globals.width! / Globals.width_10,),
                                      Icon(Bootstrap.gear_wide, color: AppColors.white, size: Globals.width! / Globals.size_24,).animate(
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
                                  SizedBox(height: Globals.width! / Globals.size_16,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(flex: 1,child: Languages()),
                                      Expanded(flex: 1, child: Frameworks()),
                                      Expanded(flex: 1, child: Tools()),
                                    ],
                                  )
                                ],
                              )
                            ),
                          ),
                          ),
                          StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: BentoContainers(color: AppColors.primary_purple, index: 6,
                          child: ClipRect(
                            child: Padding(padding: EdgeInsets.all(Globals.width! / Globals.size_20),
                              child:  notifier.hovered_bento == 6 ? RippleAnimation(
                                color: AppColors.tertiary_purple,
                                          minRadius: 60,
                                          repeat: true,
                                          ripplesCount: 5,
                                          duration: const Duration(seconds: 2),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('Get in Touch',
                                          style: TextStyle(
                                            fontSize: Globals.width! / Globals.size_32,
                                            color: AppColors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(width: Globals.width! / Globals.width_10,),
                                        Icon(Clarity.cursor_hand_click_line, color: AppColors.diffWhite,
                                          size: Globals.width! / Globals.size_24,
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
                                    SizedBox(height: Globals.width! / Globals.size_16,),
                                    ContactInfo()
                                  ],
                                ),
                              ) : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('Get in Touch',
                                          style: TextStyle(
                                            fontSize: Globals.width! / Globals.size_32,
                                            color: AppColors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(width: Globals.width! / Globals.width_10,),
                                        Icon(Clarity.cursor_hand_click_line, color: AppColors.diffWhite,
                                          size: Globals.width! / Globals.size_24,
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
                                    SizedBox(height: Globals.width! / Globals.size_16,),
                                    ContactInfo()
                                  ],
                                )
                            ),
                          )
                          ),
                          ),
                      ],
                      ),
                  ],
                )
              ),
        ),
      ),
    );
  }
}