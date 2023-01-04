// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/theme.dart';

class CustomBtnText extends StatelessWidget {
  final String text;
  final double textSize;
  final int textColor;
  final Function()? onTapAction;

  const CustomBtnText(
      {this.text = '',
      this.textSize = 24,
      this.textColor = 0xFFFFFFFF,
      this.onTapAction});

  @override
  Widget build(BuildContext context) {
    final theme = Get.put(ThemeApp());

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Color(theme.primaryColor.value),
          borderRadius: BorderRadius.circular(10)),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Color(theme.secondaryColor.value),
          onTap: onTapAction,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: textSize,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBtnIcon extends StatelessWidget {
  final IconData? icon;
  final int iconColor;
  final Function()? onTapAction;

  const CustomBtnIcon(
      {this.icon, this.iconColor = 0xFFFFFFFF, this.onTapAction});

  @override
  Widget build(BuildContext context) {
    final theme = Get.put(ThemeApp());

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Color(theme.primaryColor.value),
          borderRadius: BorderRadius.circular(10)),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Color(theme.secondaryColor.value),
          onTap: onTapAction,
          child: Center(
            child: Icon(icon, size: 28, color: Color(iconColor)),
          ),
        ),
      ),
    );
  }
}
