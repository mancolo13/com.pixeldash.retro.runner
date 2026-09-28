import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  final List<Map<String, String>> ranks = const [
    {"name": "SpeedDemon", "score": "12,450 pts", "rank": "1"},
    {"name": "PixelKing", "score": "9,820 pts", "rank": "2"},
    {"name": "CyberRacer", "score": "8,140 pts", "rank": "3"},
    {"name": "You", "score": "3,480 pts", "rank": "14"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arcade Leaderboard'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ranks.length,
        itemBuilder: (ctx, i) {
          final r = ranks[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.black,
                child: Text('#${r['rank']}'),
              ),
              title: Text(r['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(r['score']!, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.secondary)),
            ),
          );
        },
      ),
    );
  }
}
