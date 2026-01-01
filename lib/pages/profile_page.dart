// lib/pages/profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/khalid.jpg'),
            ),
            const SizedBox(height: 20),
            Text("Demnati Khalid", style: Theme.of(context).textTheme.bodyLarge),
            Text("khalid@gmail.com", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}