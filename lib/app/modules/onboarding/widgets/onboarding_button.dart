import 'package:flutter/material.dart';

import '../../../core/themes/font_themes.dart';
import '../../../core/values/colors.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({Key? key, required this.function}) : super(key: key);

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Get Started',
          style: subtitle1.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
