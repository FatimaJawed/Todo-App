import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/LoginScreen.dart';
import 'package:to_do_app/Screens/TodoApp.dart';

import 'About.dart';
import 'Settings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 30),
            ProfileMenu(
              text: "My Account",
              icon: Icons.person,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Todoapp()));
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoNotificationSettingView()));
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TodoNotificationSettingView()));
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icons.help,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));

              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 130,
      width: 130,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/fatimajawed.png"),
      ),
    );
  }
}

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  _ProfileMenuState createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  Color _iconColor = const Color(0xFF42A5F5); // Default blue color

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xFFF5F6F9),
          shadowColor: Colors.black.withOpacity(0.1),
          elevation: 3,
        ),
        onPressed: () {
          setState(() {
            _iconColor = const Color(0xFF1E88E5); // Change to darker blue on tap
          });
          if (widget.press != null) widget.press!();
        },
        child: Row(
          children: [
            Icon(widget.icon, color: _iconColor),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
