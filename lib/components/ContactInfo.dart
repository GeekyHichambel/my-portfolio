import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/colors.dart';

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
        children: [
          for (var contact in contacts) ListTile(
              mouseCursor: SystemMouseCursors.text,
              leading: Icon(contacts[contacts.indexOf(contact)].icon, color: AppColors.tertiary_purple,),
              title:  SelectableText(contacts[contacts.indexOf(contact)].label,
                                  style: const TextStyle(
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