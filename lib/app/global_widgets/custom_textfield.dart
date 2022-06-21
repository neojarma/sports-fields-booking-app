import 'package:flutter/material.dart';

import '../core/values/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.label,
    required this.isObscure,
    required this.textStyle,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final IconData icon;
  final bool isObscure;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        fillColor: grey,
        filled: true,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: grey,
          ),
        ),
      ),
    );
  }
}
