// lib/widgets/custom_drawer.dart
import 'package:flutter/material.dart';
import '../pages/profile_page.dart';
import '../pages/settings_page.dart';
import '../pages/about_page.dart';
import '../pages/chatbot_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/khalid.jpg'),
                ),
                SizedBox(height: 10),
                Text("Demnati Khalid", style: TextStyle(color: Colors.white)),
                Text("khalid@gmail.com", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profil"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage())),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Paramètres"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("À propos"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage())),
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("Chatbot"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatbotPage())),
          ),
        ],
      ),
    );
  }
}