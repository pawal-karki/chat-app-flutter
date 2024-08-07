import 'package:chat_application/widgets/my_button.dart';
import 'package:chat_application/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final void Function() onPressed;
  SignUpScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.chat,
                size: 100, color: Theme.of(context).colorScheme.tertiary),

            SizedBox(height: 10),

            //welcome message

            Text(
              'Create a New Account',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20),
            ),
            SizedBox(height: 10),
            //email textfield
            MyTextfield(
                hintText: "Enter your Email",
                controller: _emailController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress),

            //password textfield
            MyTextfield(
                hintText: "Enter your Password",
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword),
            
            //confirm password textfield
            MyTextfield(
                hintText: "Confirm your Password",
                controller: _confirmPasswordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword),
            SizedBox(height: 10),

            MyButton(text: "Sign Up", onPressed: () {}),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              TextButton(
                  onPressed: onPressed,  
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ))
            ])
          ],
        ));
  }
}
