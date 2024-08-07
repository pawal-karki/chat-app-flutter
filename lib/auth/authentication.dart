import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //Instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
    }

  signInWithEmailPassword(String text, String text2) {}


  //Sign up with email and password



  //Sign out
  Future<void> signOut() async{
    await _auth.signOut();
  }

  //error handling
}