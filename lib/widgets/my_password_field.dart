import 'package:chat_application/widgets/my_button.dart';
import 'package:chat_application/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.chat,
            size: 60,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          SizedBox(
            height: 10,
          ),
          //Welcome message
          Text(
            "Create a new account",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          SizedBox(
            height: 10,
          ),
          //Email Text Field
          MyTextfield(
            hintText: 'Enter your email',
            controller: _emailController,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
          ),
          //password text field
          MyTextfield(
            hintText: 'Enter your password',
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.text,
          ),
          MyTextfield(
            hintText: 'Confirm your password',
            controller: _confirmPasswordController,
            obscureText: true,
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: 10,
          ),
          //login button
          MyButton(
            text: 'Sign Up',
            onPressed: () {},
          ),
          //register text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text("Login",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary)))
            ],
          )
        ],
      ),
    );
  }
}