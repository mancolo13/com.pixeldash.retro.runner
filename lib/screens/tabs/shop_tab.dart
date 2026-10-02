import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ShopTab extends StatelessWidget {
  const ShopTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'name': 'Cyan Plasma Trail', 'cost': '1,200', 'owned': true},
      {'name': 'Golden Cyber Sphere', 'cost': '3,500', 'owned': false},
      {'name': 'Vaporwave Grid BG', 'cost': '5,000', 'owned': false},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Cyber Armory'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          final it = items[i];
          final owned = it['owned'] as bool;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.style_rounded, color: AppTheme.primary, size: 32),
              title: Text(it['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(owned ? 'Equipped' : 'Cost: ${it['cost']} Crystals'),
              trailing: ElevatedButton(
                onPressed: owned ? null : () {},
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.black),
                child: Text(owned ? 'Owned' : 'Unlock'),
              ),
            ),
          );
        },
      ),
    );
  }
}
