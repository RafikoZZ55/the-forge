import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/meta_provider.dart';
import 'package:the_forge/data/state/player_provider.dart';

class ForgeView extends ConsumerStatefulWidget {
  const ForgeView({super.key});

  @override
  ConsumerState<ForgeView> createState() => _ForgeViewState();
}

class _ForgeViewState extends ConsumerState<ForgeView> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final metaNotifier = ref.read(metaProvider.notifier);
    final playerNotifier = ref.read(playerProvider.notifier);
    final player = ref.watch(playerProvider);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            player.backgrounds[player.currentBackgroundIndex].background,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: SizedBox(
                width: 250,
                child: InkWell(
                  onTap: () {
                    metaNotifier.playSoundEffect();
                    playerNotifier.tapItem();
                  },
                  onTapDown: (_) =>
                      setState(() => _pressed = true),
                  onTapUp: (_) =>
                      setState(() => _pressed = false),
                  onTapCancel: () =>
                      setState(() => _pressed = false),
                  child: AnimatedScale(
                    scale: _pressed ? 0.9 : 1,
                    duration:
                        const Duration(milliseconds: 120),
                    child: Image.asset(
                      player.items[player.currentItemIndex].image,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: playerNotifier.buyLevel,
              child: Text(
                "${playerNotifier.calculatePriceOfNextLevel().toInt()}\$  +1 LVL",
                style: const TextStyle(fontSize: 20),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
