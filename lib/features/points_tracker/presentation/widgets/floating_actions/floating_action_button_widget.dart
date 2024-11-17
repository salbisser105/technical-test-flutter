
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key, required this.heroTag, this.onPressed, required this.icon,
  });
  final String heroTag;
  final  void Function()? onPressed;
  final IconData icon;
  

  @override
  Widget build(BuildContext context) {
    final color = TechnicalTestColors();

    return FloatingActionButton(
      backgroundColor:  color.mapColorsTechnicalTest['deepPurple'],
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), 
      ),
      heroTag: heroTag,
      onPressed: onPressed,
      child:  Icon(icon, color: Colors.white,size: 44,),
    );
  }
}
