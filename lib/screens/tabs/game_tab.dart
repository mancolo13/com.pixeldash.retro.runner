import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/storage_service.dart';

class GameTab extends StatefulWidget {
  const GameTab({super.key});

  @override
  State<GameTab> createState() => _GameTabState();
}

class _GameTabState extends State<GameTab> {
  int _score = 0;
  int _highScore = 0;
  bool _isPlaying = false;
  double _playerY = 0.0;
  Timer? _gameLoop;

  @override
  void initState() {
    super.initState();
    _highScore = StorageService.getInt('pixeldash_highscore');
  }

  void _startGame() {
    setState(() {
      _isPlaying = true;
      _score = 0;
      _playerY = 0.0;
    });

    _gameLoop = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _score += 10;
        if (_score > _highScore) {
          _highScore = _score;
          StorageService.setInt('pixeldash_highscore', _highScore);
        }
      });
    });
  }

  void _jump() {
    if (!_isPlaying) return;
    setState(() => _playerY = -0.5);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _playerY = 0.0);
    });
  }

  @override
  void dispose() {
    _gameLoop?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PixelDash Arcade'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Score: $_score', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Highscore: $_highScore', style: const TextStyle(fontSize: 20, color: AppTheme.secondary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: _isPlaying ? _jump : _startGame,
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.primary, width: 2),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(-0.6, _playerY),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.sports_esports, color: Colors.black),
                      ),
                    ),
                    if (!_isPlaying)
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.play_circle_fill, size: 72, color: AppTheme.secondary),
                            SizedBox(height: 12),
                            Text('TAP TO PLAY', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton.icon(
              onPressed: _isPlaying ? _jump : _startGame,
              icon: const Icon(Icons.arrow_upward),
              label: Text(_isPlaying ? 'JUMP!' : 'START DASH'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: AppTheme.background,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
