import 'package:chat_application/auth/authentication.dart';
import 'package:chat_application/widgets/my_button.dart';
import 'package:chat_application/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function() onPressed;
  LoginScreen({super.key, required this.onPressed});
  

  void login(BuildContext context) async {
    //login logic
    final authService = AuthService();
    try{
      await authService.signInWithEmailAndPassword(_emailController.text, _passwordController.text);

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()),
      duration: Duration(seconds: 2),));
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
            //logo
            Icon(Icons.chat,
                size: 100, color: Theme.of(context).colorScheme.tertiary),

            SizedBox(height: 10),

            //welcome message

            Text(
              'Welcome to ChatApp',
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
            SizedBox(height: 10),

            MyButton(text: "Login", onPressed: ()=>login(context)),
            
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ))
            ])
          ],
        ));
  }
}
