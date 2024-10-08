import 'dart:async';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Project {
  String image;
  String about;
  String? link;

  Project({required this.image, required this.about, this.link});
}

class Projects extends StatefulWidget {
  final bool isMobile;
  const Projects({this.isMobile=false, super.key});

  @override
  ProjectsState createState() => ProjectsState();
}

class ProjectsState extends State<Projects> {
  late PageController controller;
  late List<Project> projects;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    projects = [
      Project(
          image: 'assets/logo_bg.png',
          about: 'A Gamified To-Do list app with virtual pets',
          ),
      Project(
          image: 'assets/ic_launch-playstore.png',
          about: 'A Web3 wallet for safe-guarding crypto assets',
          link: 'https://github.com/GeekyHichambel/Crypto-Pilot'),
      Project(
          image: 'assets/space_mobster.jpg',
          about: 'A 2-D endless space game packed with fun',
          link: 'https://github.com/GeekyHichambel/SpaceMobster'),
    ];

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
    if (notifier.visible_project < projects.length - 1) {
      notifier.set_visible_project(notifier.visible_project + 1);
    } else {
      notifier.set_visible_project(0);
    }
    controller.animateToPage(
      notifier.visible_project,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void prevPage(Config notifier) {
    if (notifier.visible_project > 0) {
      notifier.set_visible_project(notifier.visible_project - 1);
    } else {
      notifier.set_visible_project(projects.length - 1);
    }
    controller.animateToPage(
      notifier.visible_project,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    Config notifier = Provider.of<Config>(context);

    return widget.isMobile ? ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              height: Globals.width! / Globals.width_500,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                        color: AppColors.white,
                        blurRadius: 16.0,
                        spreadRadius: 4.0,
                        blurStyle: BlurStyle.outer),
                  ]),
              child: PageView.builder(
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Image.asset(
                            projects[index].image,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(Globals.width! / Globals.width_30),
                          color: AppColors.dark_purple,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  projects[index].about,
                                  style: TextStyle(
                                    fontSize: Globals.width! / Globals.width_30*2,
                                    color: AppColors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              projects[index].link != null ? Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    var url = projects[index].link;
                                    if (await canLaunchUrlString(url!)) {
                                      launchUrlString(url);
                                    }
                                  },
                                  style: const ButtonStyle(
                                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                                    backgroundColor:
                                        WidgetStatePropertyAll(
                                            AppColors.primary_purple),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        EvaIcons.paper_plane,
                                        color: AppColors.white,
                                        size: Globals.width! / Globals.width_40,
                                      ),
                                      SizedBox(width: Globals.width! / Globals.width_30),
                                      Text(
                                        'View Project',
                                        style: TextStyle(
                                            fontSize: Globals.width! / Globals.width_40,
                                            color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ) : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ) : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => prevPage(notifier),
          iconSize: Globals.width! / Globals.width_40,
          icon: const Icon(
            OctIcons.triangle_left,
            color: AppColors.dark_purple,
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              height: Globals.width! / Globals.width_200,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                        color: AppColors.white,
                        blurRadius: 16.0,
                        spreadRadius: 4.0,
                        blurStyle: BlurStyle.outer),
                  ]),
              child: PageView.builder(
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Image.asset(
                            projects[index].image,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          color: AppColors.dark_purple,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  projects[index].about,
                                  style: TextStyle(
                                    fontSize: Globals.width! / Globals.size_12,
                                    color: AppColors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              projects[index].link != null ? Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    var url = projects[index].link;
                                    if (await canLaunchUrlString(url!)) {
                                      launchUrlString(url);
                                    }
                                  },
                                  style: const ButtonStyle(
                                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                                    backgroundColor:
                                        WidgetStatePropertyAll(
                                            AppColors.primary_purple),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        EvaIcons.paper_plane,
                                        color: AppColors.white,
                                        size: Globals.width! / Globals.size_12,
                                      ),
                                      SizedBox(width: Globals.width! / Globals.width_5),
                                      Text(
                                        'View Project',
                                        style: TextStyle(
                                            fontSize: Globals.width! / Globals.size_12,
                                            color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ) : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(OctIcons.triangle_right),
          color: AppColors.dark_purple,
          iconSize: Globals.width! / Globals.width_40,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () => nextPage(notifier),
        ),
      ],
    );
  }
}
