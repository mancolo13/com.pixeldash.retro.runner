import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class QuestsTab extends StatelessWidget {
  const QuestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final quests = [
      {'title': 'Survive 60 Seconds', 'xp': '+250 XP', 'done': true},
      {'title': 'Dodge 50 Neon Obstacles', 'xp': '+500 XP', 'done': false},
      {'title': 'Collect 10 Energy Orbs', 'xp': '+300 XP', 'done': false},
      {'title': 'Reach 5x Multiplier', 'xp': '+750 XP', 'done': false},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Quests'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: quests.length,
        itemBuilder: (ctx, i) {
          final q = quests[i];
          final done = q['done'] as bool;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(done ? Icons.check_circle_rounded : Icons.radio_button_unchecked, color: done ? AppTheme.primary : AppTheme.textSecondary),
              title: Text(q['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: Chip(
                label: Text(q['xp'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
              ),
            ),
          );
        },
      ),
    );
  }
}
