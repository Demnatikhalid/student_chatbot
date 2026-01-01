import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paramètres")),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Mode sombre"),
            trailing: Switch(value: false, onChanged: null),
          ),
          ListTile(
            title: Text("Notifications"),
            trailing: Switch(value: true, onChanged: null),
          ),
        ],
      ),
    );
  }
}