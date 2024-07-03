import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}