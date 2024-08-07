import 'package:chat_application/auth/login_or_register.dart';
import 'package:chat_application/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        //define the stream
        stream: FirebaseAuth.instance.authStateChanges(),
        //define the builder
        builder: (context, snapshot){
          if(snapshot.hasData){
            return HomeScreen();
          }
          return LoginOrRegister();
        }
      )
    );
  }
}