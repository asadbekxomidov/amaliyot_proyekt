import 'package:amaliyot_proyekt/service/reset_password_service.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final FirebaseAuthServices firebaseAuth = FirebaseAuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter Email"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              firebaseAuth.resetPassword(emailController.text);
              Navigator.pop(context);
            },
            child: Text("Send Link"),
          ),
        ],
      ),
    );
  }
}
