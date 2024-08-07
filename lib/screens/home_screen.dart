import 'package:chat_application/auth/authentication.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //logout
  void logout() async {
    AuthService().signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      actions: [
        IconButton(
          onPressed: logout,
          icon: const Icon(Icons.logout),
        )
      ],
      ),
      body: Center(
        child: Text("Welcome to the Home Screen"),
      ),
    );
  }
}