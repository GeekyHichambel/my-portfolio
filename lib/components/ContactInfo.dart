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

  final List contacts = [
    Contact(icon: Iconsax.instagram_bold, label: 'parth._.vij'),
    Contact(icon: EvaIcons.github, label: 'GeekyHichambel'),
    Contact(icon: IonIcons.mail, label: 'parth3658gcisb@gmail.com'),
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var contact in contacts) ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0.0,
              minTileHeight: Globals.height! / Globals.height_40,
              mouseCursor: SystemMouseCursors.text,
              leading: Icon(contacts[contacts.indexOf(contact)].icon, color: AppColors.tertiary_purple, size: Globals.width! / Globals.size_20,),
              title:  SelectableText(contacts[contacts.indexOf(contact)].label,
                                  style: TextStyle(
                                    fontSize: Globals.width! / Globals.size_16,
                                    color: AppColors.white,
                                  ),
                                  enableInteractiveSelection: true,
                              ),
            )
           
        ],
      ),
    );
  }
}