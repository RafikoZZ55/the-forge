import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/meta_provider.dart';
import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';
import 'package:the_forge/model/meta_data.dart';
import 'package:the_forge/model/player_state.dart';
import 'package:the_forge/pages/game_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BackgroundAdapter());
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(PlayerStateAdapter());
  await Hive.openBox<PlayerState>('playerBox');

  Hive.registerAdapter(MetaDataAdapter());
  await Hive.openBox<PlayerMetaData>('metaBox');
  runApp(const ProviderScope(child: Main()));
}

class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  @override
  ConsumerState<Main> createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  late final player = ref.read(metaProvider.notifier);

  @override
  void initState() {
    super.initState();
    player.initThemeMusic();
    player.initSoundEffect();
  }

  @override
  void dispose() {
    super.dispose();
    player.disposeThemeMusic();
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
