import 'package:flutter/material.dart';

// ─── Écran Statistiques (F6) ─────────────────────────────────────────────────
// À compléter entièrement : propriétés, constructeur, affichage des données.

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistiques'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: const Center(child: Text('À implémenter.')),
    );
  }
}
