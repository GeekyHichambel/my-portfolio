import 'package:flutter/widgets.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';

class BentoContainers extends StatelessWidget{

  final Widget? child;
  final Color? color;
  final int index;
  final double? size;

  const BentoContainers({super.key, this.child,required this.index, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    Config notifier = Provider.of<Config>(context);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onHover: (_){
        notifier.set_hovered_bento(index);
      },
      onExit: (_){
        notifier.set_hovered_bento(-1);
      },
      child: Container(
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: const [
            BoxShadow(
              color: AppColors.white,
              blurRadius: 1.0,
              blurStyle: BlurStyle.outer,
            )
          ]
          ),
        child: child,
      ),
    );
  }

}