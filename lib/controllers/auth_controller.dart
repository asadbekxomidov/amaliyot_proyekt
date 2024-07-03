// ignore_for_file: use_build_context_synchronously

import 'package:amaliyot_proyekt/service/firebase_auth_service.dart';
import 'package:amaliyot_proyekt/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  Future<void> login(String email, String password, BuildContext context) async {
    try {
      await FireBaseAuthService.login(email: email, password: password);
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  Future<void> register(String email, String password, BuildContext context) async {
    try {
      await FireBaseAuthService.register(email: email, password: password);
      Navigator.pop(context);
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
