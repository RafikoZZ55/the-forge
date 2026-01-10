import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/player_notifier.dart';
import 'package:the_forge/data/state/sound_effect_notifier.dart';

class ForgeView extends ConsumerStatefulWidget {
  const ForgeView({super.key});

  @override
  ConsumerState<ForgeView> createState() => _ForgeViewState();
}

class _ForgeViewState extends ConsumerState<ForgeView> {
  @override
  Widget build(BuildContext context) {
      final playerNotifier = ref.watch(playerProvider.notifier);
      final soundEffectNotifier = ref.read(soundEffectProvider.notifier);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ref.watch(playerProvider).backgrounds[ref.watch(playerProvider).currentBackgroundIndex].background),
          fit: BoxFit.cover
        )
      ),
      child: Center(
        child: SizedBox(
          width: 250,
          child: InkWell(
            child: Image.asset(ref.watch(playerProvider).items[ref.watch(playerProvider).currentItemIndex].image),
            onTap: () => {
              playerNotifier.tapItem(),
              soundEffectNotifier.playSoundEffect()
            },
          ),
        ),
      ),
    );
  }
}
