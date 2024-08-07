
import 'package:chat_application/auth/auth_gate.dart';
import 'package:chat_application/firebase_options.dart';
import 'package:chat_application/themes/lightmode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //initialize the app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); //initialize firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
        theme: lightMode);
  }
}
