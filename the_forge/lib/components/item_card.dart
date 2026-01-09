import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/player_notifier.dart';
import 'package:the_forge/data/static/items.dart';
import 'package:the_forge/model/item.dart';

class ItemCard extends ConsumerStatefulWidget {
  const ItemCard({super.key, required this.item} );
  final Item item;

  @override
  createState() => _ItemCardState();
}

class _ItemCardState extends ConsumerState<ItemCard> {

  @override
  Widget build(BuildContext context) {
    final playerNotifier = ref.read(playerProvider.notifier);
    final bool isOwned = ref.watch(playerProvider).items.any((invItem) => invItem.name == widget.item.name);
    final bool canBuy = ref.watch(playerProvider).items.length == staticItems.indexOf(widget.item);

    return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Column(
              
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Image.asset(
                    widget.item.image,
                    color: isOwned ? null : Colors.black,
                  ),
                  Text(
                    widget.item.description, 
                    style: TextStyle( fontSize: 12),
                  ),
                  ElevatedButton(
                    onPressed: () => playerNotifier.buyItem(item: widget.item),
                    child: Text(isOwned ? "Owned": "Buy ${widget.item.price.round()} \$"),
                  )
                ],
              ),
              Text((canBuy || isOwned) ? "" : "you need to buy previus item first" ),
            ],
          ),
        ),
    );
  }
}