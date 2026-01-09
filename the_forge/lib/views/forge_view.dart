import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/player_notifier.dart';

class ForgeView extends ConsumerStatefulWidget {
  const ForgeView({super.key});

  @override
  ConsumerState<ForgeView> createState() => _ForgeViewState();
}

class _ForgeViewState extends ConsumerState<ForgeView> {
  @override
  Widget build(BuildContext context) {
      final playerNotifier = ref.watch(playerProvider);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(playerNotifier.backgrounds[playerNotifier.currentBackgroundIndex].background),
          fit: BoxFit.cover
        )
      ),
      child: Center(
        child: SizedBox(
          width: 250,
          child: InkWell(
            child: Image.asset(playerNotifier.items[playerNotifier.currentItemIndex].image),
          ),
        ),
      ),
    );
  }
}
