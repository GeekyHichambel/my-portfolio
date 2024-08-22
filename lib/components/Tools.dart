import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';

class Tool{
  IconData icon;
  String label;

  Tool({required this.icon, required this.label});
}

class Tools extends StatelessWidget{
  
  final List tools = [
   Tool(icon: IonIcons.logo_android, label: 'Android Studio'),
   Tool(icon: TeenyIcons.git, label: 'GIT'),
   Tool(icon: AntDesign.console_sql_outline, label: 'MY SQL'),
   Tool(icon: BoxIcons.bxl_mongodb, label: 'MongoDB'),
   Tool(icon: BoxIcons.bxl_firebase, label: 'Firebase'),
   Tool(icon: BoxIcons.bxl_docker, label: 'Docker'),
   Tool(icon: BoxIcons.bxl_visual_studio, label: 'Visual Studio'),
  ];

  final bool isMobile;

  Tools({this.isMobile=false, super.key});


  @override
  Widget build(BuildContext context){
    return Container(
         height: isMobile? Globals.width! / Globals.height_200 : Globals.width! / Globals.height_100 + 48,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text('Tools',
            style: TextStyle(
              fontSize: isMobile? Globals.width! / Globals.width_40 : Globals.width! / Globals.size_16,
              color: AppColors.white,
              shadows: const [
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                )
              ]
            ), 
          )),
          Expanded(
            flex: isMobile? 7 : 10,
            child: ScrollbarTheme(
              data: const ScrollbarThemeData(interactive: false),
              child: GridView.builder(
                padding: EdgeInsets.all(isMobile? Globals.width! / Globals.width_5 : Globals.width! / Globals.size_32),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: isMobile? 5 : 3, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0),
                itemCount: tools.length,
                itemBuilder: (context, index){
                  return isMobile? Icon(tools[index].icon, color: AppColors.dark_purple, size: Globals.width! / Globals.width_10 * 6,) : Tooltip(
                    message: tools[index].label,
                    child: (
                      Icon(tools[index].icon, color: AppColors.dark_purple, size: Globals.width! / Globals.size_24,)
                    ),
                  );
                } 
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Languages extends StatelessWidget{
  final bool isMobile;
  
  final List languages = [
    Tool(icon: BoxIcons.bxl_c_plus_plus, label: 'C++'),
    Tool(icon: Bootstrap.filetype_java, label: 'Java'),
    Tool(icon: BoxIcons.bxl_javascript, label: 'JavaScript'),
    Tool(icon: BoxIcons.bxl_typescript, label: 'Typescript'),
    Tool(icon: BoxIcons.bxl_python, label: 'Python'),
    Tool(icon: BoxIcons.bxl_html5, label: 'HTML'),
    Tool(icon: BoxIcons.bxl_css3, label: 'CSS'),
  ];

  Languages({this.isMobile = false, super.key});


  @override
  Widget build(BuildContext context){
    return Container(
         height: isMobile? Globals.width! / Globals.height_200 : Globals.width! / Globals.height_100 + 48,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text('Languages',
            style: TextStyle(
              fontSize: isMobile? Globals.width! / Globals.width_40 : Globals.width! / Globals.size_16,
              color: AppColors.white,
              shadows: const [
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                )
              ]
            ), 
          )),
          Expanded(
            flex: isMobile ? 7 : 10,
            child: ScrollbarTheme(
              data: const ScrollbarThemeData(interactive: false),
              child: GridView.builder(
                padding: EdgeInsets.all(isMobile? Globals.width! / Globals.width_5: Globals.width! / Globals.size_32),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: isMobile? 5 : 3, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0),
                itemCount: languages.length,
                itemBuilder: (context, index){
                  return isMobile? Icon(languages[index].icon, color: AppColors.dark_purple, size: Globals.width! / Globals.width_10 * 6,) : Tooltip(
                    message: languages[index].label,
                    child: (
                      Icon(languages[index].icon, color: AppColors.dark_purple, size: Globals.width! / Globals.size_24,)
                    ),
                  );
                } 
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Frameworks extends StatelessWidget{
  
  final List frameworks = [
   Tool(icon: BoxIcons.bxl_flutter, label: 'Flutter'),
   Tool(icon: Iconsax.bootsrap_bold, label: 'Bootstrap'),
   Tool(icon: BoxIcons.bxl_tailwind_css, label: 'TailwindCSS'),
   Tool(icon: MingCute.react_fill, label: 'ReactJS'),
   Tool(icon: TeenyIcons.nodejs, label: 'NodeJS'),
  ];

  final bool isMobile;

  Frameworks({this.isMobile=false,super.key});


  @override
  Widget build(BuildContext context){
    return Container(
         height: isMobile? Globals.width! / Globals.height_200 : Globals.width! / Globals.height_100 + 48,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text('Frameworks',
            style: TextStyle(
              fontSize: isMobile? Globals.width! / Globals.width_40 : Globals.width! / Globals.size_16,
              color: AppColors.white,
              shadows: const [
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                )
              ]
            ), 
          )),
          Expanded(
            flex: isMobile? 7 : 10,
            child: ScrollbarTheme(
              data: const ScrollbarThemeData(interactive: false),
              child: GridView.builder(
                padding: EdgeInsets.all(isMobile? Globals.width! / Globals.width_5: Globals.width! / Globals.size_32),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: isMobile? 5 : 3, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0),
                itemCount: frameworks.length,
                itemBuilder: (context, index){
                  return isMobile? Icon(frameworks[index].icon, color: AppColors.dark_purple, size: Globals.width! / Globals.width_10 * 6,) : Tooltip(
                    message: frameworks[index].label,
                    child: (
                      Icon(frameworks[index].icon, color: AppColors.dark_purple, size: Globals.width! / Globals.size_24,)
                    ),
                  );
                } 
              ),
            ),
          ),
        ],
      ),
    );
  }
}