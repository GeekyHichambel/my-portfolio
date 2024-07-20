import 'dart:async';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Project {
  String image;
  String about;
  String link;

  Project({required this.image, required this.about, required this.link});
}

class Projects extends StatefulWidget {
  Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
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
          link: 'https://github.com/GeekyHichambel/Pawfect_Tasks'),
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => prevPage(notifier),
          iconSize: 50.0,
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
              height: 250,
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
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    var url = projects[index].link;
                                    if (await canLaunchUrlString(url)) {
                                      launchUrlString(url);
                                    }
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(
                                            AppColors.primary_purple),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        EvaIcons.paper_plane,
                                        color: AppColors.white,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        'View Project',
                                        style: TextStyle(
                                            color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
          iconSize: 50.0,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () => nextPage(notifier),
        ),
      ],
    );
  }
}
