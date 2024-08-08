import 'package:chat_application/auth/authentication.dart';
import 'package:chat_application/widgets/my_button.dart';
import 'package:chat_application/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Callback function for the login button
  final void Function() onPressed;

  // Constructor
  SignUpScreen({super.key, required this.onPressed});

  // Sign up method
  void signUp(BuildContext context) async {
    // Check if the password and confirm password are the same
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
          duration: Duration(seconds: 2),
        ),
      );
      return; // Exit the method if passwords do not match
    }

    // Show loading indicator
    showDialog(
      context: context,
      builder: (BuildContext context) => Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );

    // Authentication service
    final authService = AuthService();
    try {
      // Attempt to sign up with email and password
      await authService.signUpWithEmailAndPassword(
        _emailController.text, 
        _passwordController.text
      );

      // Hide loading indicator and navigate
      Navigator.pop(context);
    } catch (e) {
      // Hide loading indicator and show error message
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          Icon(
            Icons.chat,
            size: 100, 
            color: Theme.of(context).colorScheme.tertiary,
          ),

          SizedBox(height: 10),

          // Welcome message
          Text(
            'Create a New Account',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),

          // Email textfield
          MyTextfield(
            hintText: "Enter your Email",
            controller: _emailController,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
          ),

          // Password textfield
          MyTextfield(
            hintText: "Enter your Password",
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),

          // Confirm password textfield
          MyTextfield(
            hintText: "Confirm your Password",
            controller: _confirmPasswordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(height: 10),

          // Sign up button
          MyButton(text: "Sign Up", onPressed: () => signUp(context)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Already have an account message
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              // Login button
              TextButton(
                onPressed: onPressed,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
