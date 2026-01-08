
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';
import 'package:the_forge/model/player_state.dart';

final player = StateProvider<PlayerState>((ref) => PlayerState(
  gold: 15,
  items: [
    Item(
      name: "Hoe",
      description: "Just a hoe some farmer droped by for you to fix",
      image: "assets/images/items/hoe.png", 
      price: 10, 
      goldPerTap: 1
      )
  ],
  bacgrounds: [
    Background(
      name: "Dirty stone",
      background: "assets/images/backgrounds/wall_background.jpg", 
      price: 0
      )
  ],
  currentItemIndex: 0,
  currentBackgroundIndex: 0,
)
);