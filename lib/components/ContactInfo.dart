import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/globals.dart';

class Contact{
  IconData icon;
  String label;

  Contact({required this.icon,required this.label});
}

class ContactInfo extends StatelessWidget{
  final bool isMobile;

  final List contacts = [
    Contact(icon: Iconsax.instagram_bold, label: 'iparthvij'),
    Contact(icon: EvaIcons.github, label: 'GeekyHichambel'),
    Contact(icon: IonIcons.mail, label: 'parth3658gcisb@gmail.com'),
  ];

  ContactInfo({this.isMobile=false, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: isMobile? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          for (var contact in contacts) ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: isMobile? Globals.width! / Globals.width_30 : 0.0,
              minTileHeight: isMobile? Globals.width! / Globals.width_30*2 : Globals.height! / Globals.height_40,
              mouseCursor: SystemMouseCursors.text,
              leading: Icon(contacts[contacts.indexOf(contact)].icon, color: AppColors.tertiary_purple, size: isMobile?  Globals.width! / Globals.width_30*2 : Globals.width! / Globals.size_20,),
              title:  SelectableText(contacts[contacts.indexOf(contact)].label,
                                  style: TextStyle(
                                    fontSize: isMobile? Globals.width! / Globals.width_30*2 :Globals.width! / Globals.size_16,
                                    color: AppColors.white,
                                  ),
                                  enableInteractiveSelection: isMobile? false : true,
                              ),
            )
           
        ],
      ),
    );
  }
}