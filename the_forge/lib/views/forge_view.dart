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
            child: AnimatedScale(
              scale: _pressed ? 0.65 : 1, 
              duration: Duration(milliseconds: 400),
              child: Image.asset(ref.watch(playerProvider).items[ref.watch(playerProvider).currentItemIndex].image),
            ),
            onTap: () => {
              metaNotifier.playSoundEffect(),
              playerNotifier.tapItem(),
            },
            onTapDown: (_) => setState(() => _pressed = true),
            onTapUp: (_) => setState(() => _pressed = false),
          ),
        ),
      ),
    );
  }
}
