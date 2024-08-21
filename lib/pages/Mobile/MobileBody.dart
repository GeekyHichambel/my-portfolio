import 'package:flutter/material.dart';
import 'package:my_portfolio/components/AbtMe.dart';

class MobileBody extends StatelessWidget{
  const MobileBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbtMe(),
      ],
    );
  }

}