import 'package:flutter/material.dart';
import 'package:notes_flutter/core/theme/app_pallete.dart';

class CustomTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  const CustomTextFormFeild(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppPallete.gradient2,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        hintText: hintText,
      ),
      maxLines: null,
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
    );
  }
}
