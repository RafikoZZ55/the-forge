import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/components/background_card_shop.dart';
import 'package:the_forge/components/item_card_shop.dart';
import 'package:the_forge/data/state/shop_state.dart';

class ShopView extends ConsumerStatefulWidget {
const ShopView({ super.key });

  @override
  ConsumerState<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends ConsumerState<ShopView> {
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2, 
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.handshake_rounded),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55
                  ),
                  itemCount: ref.watch(shop).items.length,
                  itemBuilder: (context, index) => ItemCardShop(item: ref.watch(shop).items[index]),
                ),
                 GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                    ), 
                    itemCount: ref.watch(shop).backgrounds.length,
                    itemBuilder: (context, index) => BackgroundCardShop(background: ref.watch(shop).backgrounds[index]),
                  )
              ]
            )
          ),
        ],
      ),
    );
  }
}