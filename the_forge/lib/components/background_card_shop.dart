import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/player_provider.dart';
import 'package:the_forge/data/static/backgrounds.dart';
import 'package:the_forge/model/background.dart';

class BackgroundCardShop extends ConsumerStatefulWidget {
  const BackgroundCardShop({ super.key, required this.background  });
  final Background background;

  @override
  createState() => _BackgroundCardState();
}

class _BackgroundCardState extends ConsumerState<BackgroundCardShop> {
  @override
  Widget build(BuildContext context) {
    final playerNotifier = ref.read(playerProvider.notifier);
    bool isOwned = ref.watch(playerProvider).backgrounds.contains(widget.background);
    bool canBuy = ref.watch(playerProvider).backgrounds.length == staticBackgrounds.indexOf(widget.background);

    return Card(
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.background.background),
                    fit: BoxFit.cover,
                    colorFilter: isOwned || canBuy ? null : ColorFilter.mode(Colors.black, BlendMode.src)
                  )
                ),
              ),
              ElevatedButton(
                  onPressed: () => playerNotifier.buyBackground(background: widget.background), 
                  child: Text(isOwned ? "Owned" : "buy ${widget.background.price.toInt()} \$")
              ),
            ],
          ),
          Text(canBuy || isOwned ? "" : "you need to buy previous background first",
          textAlign: TextAlign.center
          ,)
        ],
      ),
    );
  }
}