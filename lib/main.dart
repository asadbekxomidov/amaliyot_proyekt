// ignore_for_file: duplicate_import,

import 'package:amaliyot_proyekt/controllers/auth_controller.dart';
import 'package:amaliyot_proyekt/controllers/card_controller.dart';
import 'package:amaliyot_proyekt/controllers/cars_controller.dart';
import 'package:amaliyot_proyekt/controllers/category_controller.dart';
import 'package:amaliyot_proyekt/controllers/products_controller.dart';
import 'package:amaliyot_proyekt/firebase_options.dart';
import 'package:amaliyot_proyekt/screens/admin_panel_screen.dart';
import 'package:amaliyot_proyekt/screens/images_list_screen.dart';
import 'package:amaliyot_proyekt/screens/home_screen.dart';
import 'package:amaliyot_proyekt/screens/login_screen.dart';
import 'package:amaliyot_proyekt/screens/register_screen.dart';
import 'package:amaliyot_proyekt/screens/reset_password_screen.dart';
import 'package:amaliyot_proyekt/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsController()),
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => CartController()),
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => CarsController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(317, 790),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          )),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              }
              return const LoginScreen();
            },
          ),
          routes: {
            AppRoutes.login: (context) => const LoginScreen(),
            AppRoutes.register: (context) => const RegisterScreen(),
            AppRoutes.home: (context) => const HomeScreen(),
            AppRoutes.cardlist: (context) => const CardListScreen(),
            AppRoutes.adminPanel: (context) => AdminPanelScreen(),
            AppRoutes.resetPassword: (context) => ResetPasswordScreen(),
          },
        );
      },
    );
  }
}
