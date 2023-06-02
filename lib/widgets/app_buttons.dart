import 'package:flutter/material.dart';
import 'package:master_travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final Color? borderColor;
  final String? text;
  final IconData? icon;
  final bool? isIcon;
  const AppButtons(
      {super.key,
      this.isIcon = false,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor,
      this.text,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor!,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(text: text!, color: color!),
            )
          : Center(
              child: Icon(icon, color: color),
            ),
    );
  }
}
