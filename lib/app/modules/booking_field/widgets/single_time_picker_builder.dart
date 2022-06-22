import 'package:flutter/material.dart';

import '../../../core/themes/font_themes.dart';

class SingleTimePickerBuilder extends StatelessWidget {
  const SingleTimePickerBuilder({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.hour,
    required this.hourColor,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;
  final String hour;
  final Color hourColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(
          child: Text(
            hour,
            style: smallText.copyWith(color: hourColor),
          ),
        ),
      ),
    );
  }
}
