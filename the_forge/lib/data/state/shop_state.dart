import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';
import 'package:the_forge/model/shop.dart';

final shop = StateProvider<Shop>((ref) => Shop(
  items: [
    Item(
      name: "Hoe",
      description: "Just a hoe some farmer droped by for you to fix",
      image: "assets/images/items/hoe.png", 
      price: 10, 
      goldPerTap: 1
    ),
    Item(
      name: "Shovel", 
      description: "Shovel covered in mud. A litle bit broken but with the right touch it can look like brand new", 
      image: "assets/images/items/shovel.png", 
      price: 50, 
      goldPerTap: 5
    ),
    Item(
    name: "Pickaxe", 
    description: "One day a miner came to you asking if you can fix his pickaxe, after some negociations you decided to give it a go", 
    image: "assets/images/items/pickaxe.png", 
    price: 225, 
    goldPerTap: 10
    ),
    Item(
      name: "Axe", 
      description: "One day you found it in a pound and decide to fix it", 
      image: "assets/images/items/axe.png", 
      price: 350, 
      goldPerTap: 20
    ),
    Item(
      name: "Sword", 
      description: "After geting some fame in the village a knight came and asked you if you could repair his sword, ofcourse you said yes", 
      image: "assets/images/items/sword_1.png", 
      price: 1500, 
      goldPerTap: 75
    ),
    Item(
      name: "Katane", 
      description: "You are now a world famous blacksmith at least thats what samuray that came to sayed", 
      image: "assets/images/items/katana.png", 
      price: 4500, 
      goldPerTap: 125
      )
  ],
  backgrounds: [
    Background(
      name: "Dirty stne", 
      background: "assets/images/backgrounds/wall_backgroundjpg", 
      price: 0,
    ),
    Background(
      name: "Burrned wood", 
      background: "assets/images/background/burned_wood_background.jpg", 
      price: 15,
    ),
    Background(
      name: "Fire", 
      background: "assets/images/backgrounds/fire_background.jpg", 
      price: 50
    ),
    Background(
      name: "Pesant anvil", 
      background: "assets/images/backgrounds/anvil.jpg", 
      price: 100
    ),
    Background(
      name: "Royal wall", 
      background: "assets/images/backgrounds/dot_background.jpg", 
      price: 500,
    ),
    Background(
      name: "Noble anvil", 
      background: "assets/images/backgrounds/anvil_2.jpg", 
      price: 1000
    ),
    Background(
      name: "Royal forge", 
      background: "assets/images/backgrounds/acual_forge.jpg", 
      price: 2500
    )
  ]
));