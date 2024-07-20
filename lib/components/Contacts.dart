import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:my_portfolio/js_interlop.dart';

class Contacts extends StatelessWidget{

  final List icons = [
    [Bootstrap.instagram, 'https://instagram.com/parth._.vij'],
    [Bootstrap.github, 'https://github.com/GeekyHichambel'],
    [Bootstrap.mailbox, 'mailto:parth3658gcisb@gmail.com'],
  ];

  Contacts({super.key});

  @override
  Widget build(BuildContext context){
    Config notifier = Provider.of<Config>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var icon in icons) Container(
          margin: const EdgeInsets.all(10.0),
          child: MouseRegion(
            onHover: (_) {notifier.set_hovered_footer(icons.indexOf(icon)); updatePanelStatus(icon[1]);},
            onExit: (_) {notifier.set_hovered_footer(-1); clearPanelStatus();},
            cursor: SystemMouseCursors.click,
            child: Tooltip(
              message: icon[1],
              child: GestureDetector(
                onTap: () async {
                  final url = icon[1];
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url, mode: LaunchMode.platformDefault);
                  } else {
                    debugPrint('Could not launch $url');
                  }
                },
                child: Icon(icon[0], color: AppColors.diffWhite, shadows: notifier.hovered_footer_icon == icons.indexOf(icon)  ? [
                  const BoxShadow(
                    color: AppColors.white,
                    blurRadius: 20.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                     const BoxShadow(
                    color: AppColors.white,
                    blurRadius: 20.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ] : [],),
              ),
            )
            )
          )
      ],
    );
  }
}