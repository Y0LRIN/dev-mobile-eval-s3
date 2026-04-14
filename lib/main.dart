import 'package:flutter/material.dart';
import 'stats_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo), useMaterial3: true),
      home: const TodoListScreen(),
    );
  }
}

// ─── Modèle de données (ne pas modifier) ─────────────────────────────────────

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
}

// ─── Écran principal ─────────────────────────────────────────────────────────

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // F1 — Déclarez votre liste de tâches ici (au moins 3 tâches par défaut)

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Todo List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // F5 — Navigation vers l'écran Statistiques
      ),
      // Tout le body est à construire : zone de saisie (F2), liste (F1/F3/F4)
      body: const Center(child: Text('À vous de jouer.')),
    );
  }
}
