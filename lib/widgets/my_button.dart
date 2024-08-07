import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  const MyButton({super.key,required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(onPressed: onPressed, 
    style: ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.tertiary,
      foregroundColor: theme.colorScheme.inversePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(text,style: theme.textTheme.labelLarge,));
  }
}