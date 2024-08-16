import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';


class Review{
  String name;
  String message;
  bool isMale;

  Review(this.name, this.message, this.isMale);
}

class ReveiwShowcase extends StatefulWidget{
  const ReveiwShowcase({super.key});

  @override
  ReveiwShowcaseState createState() => ReveiwShowcaseState();
}

class ReveiwShowcaseState extends State<ReveiwShowcase>{
  List<Review> reviews = [
    Review('Sam', 'Good Work!', true),
    Review('Diana', 'Upcoming talent! Awesome designs', false)
  ];

  late final PageController pageController;
  bool isMale = true;
  late final Timer timer;

  @override
  void initState(){
    super.initState();
    pageController = PageController();
     timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      Config notifier = Provider.of<Config>(context, listen: false);
      nextPage(notifier);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void nextPage(Config notifier) {
    if (notifier.visible_review < reviews.length - 1) {
      notifier.set_visible_review(notifier.visible_review + 1);
    } else {
      notifier.set_visible_review(0);
    }
    pageController.animateToPage(
      notifier.visible_project,
      duration: const Duration(milliseconds: 750),
      curve: Curves.linear,
    );
  }



  @override
  Widget build(BuildContext context){
    Config notifier = Provider.of<Config>(context);

    return VisibilityDetector(
        key: const Key('Reviews'),
        onVisibilityChanged: (_) {if (_.visibleFraction > 0.25){
          notifier.set_section_visible('Reviews');
          notifier.set_visited('Reviews');
        }else{
          notifier.remove_section('Reviews');
        }
        } ,
        child:SizedBox(
          child: Stack(
              children: [
                Positioned(
                  width: Globals.width,
                  height: Globals.width! / Globals.height_500 * 10,
                  child: ClipRect(
                    child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: AppColors.diffWhite.withOpacity(0.75),
                    ),
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Globals.Padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hear from my Clients..',
                        style: TextStyle(
                          color: AppColors.tertiary_purple,
                          fontSize: Globals.width! / Globals.size_32 * 2,
                        ),
                      ),
                      SizedBox(height: Globals.width! / Globals.width_40,),
                      Container(
                            width: Globals.width,
                            height: Globals.width! / Globals.height_500,
                            padding: const EdgeInsets.all(0.0),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        border: Border(bottom: BorderSide(color: AppColors.dark_purple))
                      ),
                      child: PageView.builder(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: reviews.length,
                        itemBuilder: (context, index){return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: Globals.sysFont,
                                      fontSize: Globals.width! / Globals.size_32 * 2, 
                                      color: AppColors.primary_purple
                                    ),
                                    children: [
                                      const TextSpan(text: '"', ),
                                      TextSpan(text: reviews[index].message,),
                                      const TextSpan(text: '"' ,),
                                    ]
                                  )),
                                  Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Text("~ ${reviews[index].name}", style: TextStyle(fontSize: Globals.width! / Globals.size_32, color: AppColors.tertiary_purple)),
                                  )
                                ],
                              ),
                            )),
                            Expanded(child: Container(
                              padding: EdgeInsets.all(Globals.width! / Globals.width_30),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  LottieBuilder.asset('assets/blob.json',),
                                  Positioned(
                                    width: Globals.width! / Globals.width_300,
                                    height: Globals.width! / Globals.width_300,
                                    child: CircleAvatar(
                                      radius: 16.0,
                                      child: Padding(
                                        padding: EdgeInsets.all(Globals.width! / Globals.width_40),
                                        child: Image.asset(reviews[index].isMale ? 'assets/man.png' : 'assets/woman.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                  )
                                ],
                              ),
                            ),),
                          ],
                        );},
                      )
                      ),
                      SizedBox(height: Globals.width! / Globals.width_80,),
                        Text(
                        'Leave one of your own..',
                        style: TextStyle(
                          color: AppColors.tertiary_purple,
                          fontSize: Globals.width! / Globals.size_32,
                        ),
                      ),
                      SizedBox(height: Globals.width! / Globals.width_10 * 5,),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: Globals.width! * 0.8,
                              padding: const EdgeInsets.all(Globals.Padding * 0.5),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColors.magical_pink,
                                    blurRadius: 10.0,
                                    spreadRadius: 5.0
                                  )
                                ],
                                border: Border.all(color: AppColors.magical_pink, width: 1.0)
                              ),
                              child: Column(
                                children: [
                                   Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      padding: EdgeInsets.all(Globals.width! / Globals.width_10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.primary_purple),
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          TextButton(onPressed: (){
                                             setState(() {
                                              isMale = !isMale;
                                            });                    
                                          },
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStatePropertyAll(isMale ? AppColors.primary_purple : Colors.transparent)
                                          ),
                                           child: Text(
                                          'Male',
                                          style: TextStyle(
                                            color: isMale? AppColors.white : AppColors.dark_purple,
                                            fontSize: Globals.width! / Globals.size_16,
                                          ),
                                                                            ),),
                                          SizedBox(width: Globals.width! / Globals.width_5,),
                                          TextButton(onPressed: (){
                                            setState(() {
                                              isMale = !isMale;
                                            });                          
                                          },
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStatePropertyAll(!isMale ? AppColors.primary_purple : Colors.transparent)
                                          ),
                                           child: Text(
                                          'Female',
                                          style: TextStyle(
                                            color: !isMale? AppColors.white : AppColors.dark_purple,
                                            fontSize: Globals.width! / Globals.size_16,
                                          ),
                                                                            ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text(
                                    'Name:',
                                    style: TextStyle(
                                      color: AppColors.tertiary_purple,
                                      fontSize: Globals.width! / Globals.size_16,
                                    ),
                                  ),
                                    title: const TextField(
                                      style: TextStyle(
                                        
                                      ),
                                    ),
                                  ),
                                      ListTile(
                                    leading: Text(
                                    'Review:',
                                    style: TextStyle(
                                      color: AppColors.tertiary_purple,
                                      fontSize: Globals.width! / Globals.size_16,
                                    ),
                                  ),
                                    title: const TextField(
                                      style: TextStyle(
                                        
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Globals.width! / Globals.width_30,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(onPressed: (){
                            
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(AppColors.primary_purple)
                                    ),
                                     child: Text(
                                    'Post',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: Globals.width! / Globals.size_16,
                                    ),
                                  ),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(child: Image.asset(
                            'assets/review.png',
                            fit: BoxFit.contain,
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
        ),
      );
  }
}