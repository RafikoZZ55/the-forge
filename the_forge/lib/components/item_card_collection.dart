import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/player_notifier.dart';
import 'package:the_forge/model/item.dart';

class ItemCardCollection extends ConsumerStatefulWidget {
  const ItemCardCollection({ super.key, required this.item, required this.itemIndex});
  final Item item;
  final int itemIndex;

  @override
  createState() => _ItemCardCollectionState();
}

class _ItemCardCollectionState extends ConsumerState<ItemCardCollection> {
  @override
  Widget build(BuildContext context) {
    final player = ref.watch(playerProvider);
    final playerNotifier = ref.read(playerProvider.notifier);
    final bool isEquipped = player.currentItemIndex == widget.itemIndex;   

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.item.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Image.asset(widget.item.image),
          Text(widget.item.description),
          ElevatedButton(
            onPressed: () => playerNotifier.changeCurrentItem(index: widget.itemIndex), 
            child: Text(isEquipped ? "Eqipped" : "Equip")
          )
        ],
      ),
    );
  }
}