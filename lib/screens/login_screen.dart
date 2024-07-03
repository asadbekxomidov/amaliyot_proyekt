import 'package:amaliyot_proyekt/controllers/auth_controller.dart';
import 'package:amaliyot_proyekt/utils/app_routes.dart';
import 'package:amaliyot_proyekt/utils/messages.dart';
import 'package:amaliyot_proyekt/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void sumbit() {
    if (formKey.currentState!.validate()) {
      Messages.showLoadingDialog(context);
      Provider.of<AuthController>(context, listen: false)
          .login(emailController.text, passwordController.text, context);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        centerTitle: true,
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.abc, size: 140, color: Colors.blue),
                Text(
                  'TIZIMGA KIRISH',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20),
                MyTextField(
                  controller: emailController,
                  label: "Email",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please Enter email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  label: "Password",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please Enter password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: sumbit,
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('K I R I S H'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: Text("Ro'yxatdan o'tish"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.resetPassword);
                      },
                      child: Text("Password reset"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
