import 'package:amaliyot_proyekt/utils/app_routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Admin Panel'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.adminPanel);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


