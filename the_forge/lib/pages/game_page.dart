import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/player_provider.dart';
import 'package:the_forge/pages/settings_page.dart';
import 'package:the_forge/views/collection_view.dart';
import 'package:the_forge/views/forge_view.dart';
import 'package:the_forge/views/shop_view.dart';

class GamePage extends ConsumerStatefulWidget {
  const GamePage({ super.key });

  @override
  createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  static const List<Widget> views = [
    ShopView(),
    ForgeView(),
    CollectionView(),
  ];

  int selectedIndex = 1;


  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lvl ${ref.watch(playerProvider).level} | ${ref.watch(playerProvider.notifier).calculateGoldMultiplier()}x | ${ref.watch(playerProvider).gold.toStringAsFixed(1)} 🪙"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage())),
            icon: Icon(Icons.settings_rounded),
            )
        ],
        actionsPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),

      body:  views[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.handyman_rounded), label: "Forge"),
          BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark_rounded), label: "Collection"),
        ],
        currentIndex: selectedIndex,
        onTap: (value) => setState(() { selectedIndex = value;}),
        showUnselectedLabels: false,
      ),
    );
  }
}