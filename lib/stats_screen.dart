import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;
  final int remainingTasks;

  const StatsScreen({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
    required this.remainingTasks,
  });

  @override
  Widget build(BuildContext context) {
    final double completionRate =
        totalTasks == 0 ? 0 : (completedTasks / totalTasks) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vue d’ensemble',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _StatLine(label: 'Total', value: totalTasks.toString()),
                    const SizedBox(height: 8),
                    _StatLine(
                      label: 'Complétées',
                      value: completedTasks.toString(),
                      valueColor: Colors.green,
                    ),
                    const SizedBox(height: 8),
                    _StatLine(
                      label: 'Restantes',
                      value: remainingTasks.toString(),
                      valueColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Complétion',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${completionRate.toStringAsFixed(1)} %',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: totalTasks == 0 ? 0 : completedTasks / totalTasks,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      totalTasks == 0
                          ? 'Aucune tâche pour le moment.'
                          : '$completedTasks tâche(s) terminée(s) sur $totalTasks',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[700],
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatLine extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _StatLine({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: valueColor ?? Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
