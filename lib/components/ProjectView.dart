import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/components/CarouselItem.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:visibility_detector/visibility_detector.dart';


class ProjectView extends StatefulWidget{

  const ProjectView({super.key});

  @override
  ProjectViewState createState()=> ProjectViewState(); 
}

class ProjectViewState extends State<ProjectView> with TickerProviderStateMixin{

    List<CarouselItem> carouselItems = [
    CarouselItem(title: 'Pawfect Tasks', about: 'A gamified To-Do list with virtual pets which maximises your productiveness.', tech: [BoxIcons.bxl_flutter, BoxIcons.bxl_python, BoxIcons.bxl_firebase], image: Image.asset('assets/logo_bg.png', fit: BoxFit.fill,)),
    CarouselItem(title: 'Space Mobster', about: 'A 2-d space game with endless fun.', tech: [BoxIcons.bxl_python], image: Image.asset('assets/space_mobster.jpg', fit: BoxFit.fill,)),
  ];

  PageController pageController = PageController();
  bool changed = false;  


  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    Config notifier = Provider.of<Config>(context);

    return VisibilityDetector(
      key: const Key('Projects'),
      onVisibilityChanged: (_){
        if (_.visibleFraction > 0.25){
          notifier.set_section_visible('Projects');
          notifier.set_visited('Projects');
        }else{
          notifier.remove_section('Projects');
        } },
      child: Container(
        padding: const EdgeInsets.all(Globals.Padding),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        width: Globals.width,
        height: Globals.width! / Globals.height_500,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(flex: 3,child: MouseRegion(
              cursor: SystemMouseCursors.grab,
              child: Stack(
                children: [
                  StackedCardCarousel(
                    initialOffset: Globals.width! / Globals.width_40,
                    spaceBetweenItems: Globals.width! / Globals.width_500,
                    pageController: pageController,
                    onPageChanged: (index){
                      notifier.set_selected_project(index);
                      setState(() {
                        changed = true;
                      });
                    },
                    type: StackedCardCarouselType.fadeOutStack,
                    items: [
                          for (var carousel in carouselItems) Carousel(item: carousel, index: carouselItems.indexOf(carousel),)
                        ]),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: (){
                              pageController.animateTo(pageController.initialScrollOffset, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                            }, icon: Icon(Iconsax.arrow_up_1_outline, color: AppColors.dark_purple, size: Globals.width! / Globals.size_32,)),
                  )
                ],
              ),
            ),),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 2,child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset('assets/splash1.svg', fit: BoxFit.contain,).animate(
                        effects: !changed ? [
                                          const ShakeEffect(
                                            duration: Duration(seconds: 2),
                                            curve: Curves.decelerate,
                                            rotation: 0.2,
                                            hz: 0.5,
                                          ),
                                        ] : [
                                          const FadeEffect(
                                            duration: Duration(milliseconds: 800),
                                            curve: Curves.easeIn,
                                            begin: 0.0,
                                            end: 1.0,
                                          )
                                        ],
                                        autoPlay: true,
                                        onComplete: (_) => changed ? setState(() {
                                          changed = false;
                                        }) : _.repeat()
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Globals.width! / Globals.width_100 * 1.7, vertical: Globals.width! / Globals.width_80),
                        child: Text(
                          carouselItems[notifier.selected_project].about ?? '',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: Globals.width! / Globals.size_16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
                  SizedBox(height: Globals.width! / Globals.width_10,),
                  Expanded(child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset('assets/splash2.svg', fit: BoxFit.contain,).animate(
                        effects: !changed ?  [
                                          const ShakeEffect(
                                            duration: Duration(seconds: 2),
                                            curve: Curves.decelerate,
                                            rotation: 0.2,
                                            hz: 0.5,
                                          ),
                                        ] : [
                                          const FadeEffect(
                                            duration: Duration(milliseconds: 800),
                                            curve: Curves.easeIn,
                                            begin: 0.0,
                                            end: 1.0,
                                          )
                                        ],
                                        autoPlay: true,
                                        onComplete: (_) => changed ? setState(() {
                                          changed = false;
                                        }) : _.repeat()
                                        // controller: controller,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Globals.width! / Globals.width_200, vertical: Globals.width! / Globals.width_40),
                        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemCount: carouselItems[notifier.selected_project].tech!.length,
                         itemBuilder: (context, index){
                          return Icon(
                            carouselItems[notifier.selected_project].tech![index],
                            color: AppColors.white,
                            size: Globals.width! / Globals.size_20,
                          );
                         })
                      ),
                    ],
                  )),   
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}