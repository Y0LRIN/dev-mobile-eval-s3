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

  final List<Task> _tasks = [
    Task(title: 'Faire les courses'),
    Task(title: 'Réviser'),
    Task(title: 'Insérer un rickroll'),
  ];

  final TextEditingController _controller = TextEditingController();

  bool _showInputError = false;

  void _addTask() {
    final text = _controller.text.trim();

    if (text.isEmpty) {
      setState(() => _showInputError = true);
      return;
    }
    setState(() {
      _tasks.add(Task(title: text));
      _controller.clear();
      _showInputError = false;
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: (value) {
                      if (_showInputError && value.trim().isNotEmpty) {
                        setState(() => _showInputError = false);
                      }
                    },
                    onSubmitted: (_) => _addTask(),
                    decoration: InputDecoration(
                      labelText: 'Nouvelle tâche',
                      errorText: _showInputError ? 'Le titre ne peut pas être vide' : null,
                      border: const OutlineInputBorder(),
                    ),
                  )
                ),
                const SizedBox(width: 8),
                FilledButton(onPressed: _addTask, child: const Text('Ajouter'),),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];

                  return Dismissible(
                    key: ValueKey(task),
                    direction: DismissDirection.horizontal,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      final removedTaskTitle = task.title;

                      setState(() {
                        _tasks.removeAt(index);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Removed: $removedTaskTitle'),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Checkbox(
                        value: task.isDone,
                        onChanged: (value) {
                          setState(() {
                            task.isDone = value ?? false;
                          });
                        },
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
                          color: task.isDone ? Colors.grey : Colors.black,
                          fontWeight: task.isDone ? FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}