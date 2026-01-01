import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Accueil")),
      drawer: const CustomDrawer(),
      body: Center(
        child: Text(
          "Bienvenue dans Smart Student Assistant",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}