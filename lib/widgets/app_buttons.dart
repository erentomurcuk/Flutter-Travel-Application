import 'package:flutter/material.dart';
import 'package:travel_application/misc/colors.dart';
import 'package:travel_application/widgets/app_text.dart';

class AppButtons extends StatelessWidget {

  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;

  String? text;
  IconData? icon;
  bool? isIcon;

  AppButtons({Key? key,
    this.isIcon = false,
    this.text = "Hi",
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.0),

      ),

      // TODO: change colour
      child: isIcon == false ?
      Center(child: AppText(text: text!, colour: color,)) :
      Center(child: Icon(icon, color:color)),

    );
  }
}
