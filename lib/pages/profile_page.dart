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
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            Text("Jean Dupont", style: Theme.of(context).textTheme.bodyLarge),
            Text("jean@example.com", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}