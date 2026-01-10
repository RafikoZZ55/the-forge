import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/theme_music_notifier.dart';
import 'package:the_forge/pages/game_page.dart';

void main() {
  runApp(const ProviderScope(child: Main()));
}

class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  @override
  ConsumerState<Main> createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {

  @override void initState() {
    super.initState();
    ref.read(themeMusicProvider.notifier).initTheme();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CupertinoColors.placeholderText,
          brightness: Brightness.dark,
        ),
      ),
      home: const GamePage(),
    );
  }
}
