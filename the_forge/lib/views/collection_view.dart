import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/components/background_card_collection.dart';
import 'package:the_forge/components/item_card_collection.dart';
import 'package:the_forge/data/state/player_provider.dart';


class CollectionView extends ConsumerStatefulWidget {
const CollectionView({ super.key });

  @override
  ConsumerState<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends ConsumerState<CollectionView> {
  @override
  Widget build(BuildContext context){
    final player = ref.watch(playerProvider);

    return DefaultTabController(
      length: 2, 
      child: Column(
        children: [
          TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.handyman_rounded),
            text: "Items",
          ),
          Tab(
            icon: Icon(Icons.image_rounded),
            text: "Backgrounds",
          )
        ]
        ),
        Expanded(
          child: TabBarView(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5
                ), 
                itemCount: player.items.length,
                itemBuilder: (context, index) => ItemCardCollection(item: player.items[index], itemIndex: index),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5
                ), 
                itemCount: player.backgrounds.length,
                itemBuilder: (context, index) => BackgroundCardCollection(background: player.backgrounds[index], backgroundIndex: index),
              )
            ]
          )
        ),
        ],
      )
      );
  }
}