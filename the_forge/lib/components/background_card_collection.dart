import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/player_provider.dart';
import 'package:the_forge/model/background.dart';


class BackgroundCardCollection extends ConsumerStatefulWidget {
  const BackgroundCardCollection({ super.key, required this.background, required this.backgroundIndex });
  final Background background;
  final int backgroundIndex;

  @override
  createState() => _BackgroundCardCollectionState();
}

class _BackgroundCardCollectionState extends ConsumerState<BackgroundCardCollection> {
  @override
  Widget build(BuildContext context) {
  final player = ref.watch(playerProvider);
  final playerNotifier = ref.read(playerProvider.notifier);
  final bool isEquipped = player.currentBackgroundIndex == widget.backgroundIndex;

    return Card(
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.background.background),
                fit: BoxFit.cover
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => playerNotifier.changeCurrentBackground(index: widget.backgroundIndex), 
            child: Text(isEquipped ? "Uneqip" : "Equip")
          )
        ],
      ),
    );
  }
}