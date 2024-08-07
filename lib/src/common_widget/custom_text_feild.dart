import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomTextFeilds(
    String name,
    TextEditingController controller,
    String? Function(String)? validator,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    TextInputType? keyboardtype,
    TextCapitalization capital
    ) {
  return TextField(
    textCapitalization: capital,
    keyboardType: keyboardtype,
    controller: controller,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      labelText: name,
      suffixIcon: suffixIcon != null
          ? IconButton(
        icon: Icon(suffixIcon),
        onPressed: onSuffixPressed,
      )
          : null,
      errorText: validator != null ? validator(controller.text) : null,
    ),
  );
}