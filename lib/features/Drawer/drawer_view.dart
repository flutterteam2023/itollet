import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 48,
                ),
                const SizedBox(height: 9),
                Text(
                  "User Name",
                  style: _buildTextStyle().copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              "İLANLARIM",
              style: _buildTextStyle(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              "CÜZDANIM",
              style: _buildTextStyle(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              "GİZLİLİK",
              style: _buildTextStyle(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              "YARDIM",
              style: _buildTextStyle(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                scaffoldKey.currentState?.closeDrawer();
                Future.delayed(const Duration(milliseconds: 500), () {
                  context.popRoute();
                });
              });
            },
            title: Text(
              "OTURUMU SONLANDIR",
              style: _buildTextStyle(),
            ),
            trailing: Icon(
              Icons.logout,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'Rubik',
    );
  }
}
