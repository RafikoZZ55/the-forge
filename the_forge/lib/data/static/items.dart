import 'package:the_forge/model/item.dart';

final List<Item> staticItems = [
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
];