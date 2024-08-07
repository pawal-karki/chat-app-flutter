import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const MyTextfield(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.obscureText,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          hintStyle: TextStyle(color: theme.colorScheme.secondary),
          fillColor: theme.colorScheme.tertiary,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.secondary),
            borderRadius: BorderRadius.circular(10), // Add border radius here
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary),
            borderRadius: BorderRadius.circular(10), // Add border radius here
          ),
        ),
      ),
    );
  }
}
