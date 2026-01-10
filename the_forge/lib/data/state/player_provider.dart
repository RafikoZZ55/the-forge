
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/static/backgrounds.dart';
import 'package:the_forge/data/static/items.dart';
import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';
import 'package:the_forge/model/player_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

final playerProvider = StateNotifierProvider<PlayerNotifier, PlayerState>(
  (ref) {
    var box = Hive.box<PlayerState>('playerBox');
    PlayerState? player = box.get('player1');
    if (player == null) {
        player = PlayerState(
          gold: 15,
          items: [staticItems[0]],
          backgrounds: [staticBackgrounds[0]],
          currentItemIndex: 0,
          currentBackgroundIndex: 0,
        );
        box.put('player1', player);
    }
    return PlayerNotifier(player);
  }
);


class PlayerNotifier extends StateNotifier<PlayerState> {
  PlayerNotifier(super.state);

  void buyItem({ required Item item}) {
    if(checkIfPreviousItemWasBought(item: item)) return;
    if(checkIfItemBought(item: item)) return;
    if(state.gold < item.price) return;

    state = state.copyWith(
      gold: state.gold - item.price, 
      items: [...state.items, item], 
      currentItemIndex: state.items.length, 
    );
    Hive.box<PlayerState>('playerBox').put('player1', state);
  }

  void buyBackground({ required Background background}) {
    if(checkIfPreviousBackgroundWasBought(background: background)) return;
    if(checkIfBackgroundBought(background: background)) return;
    if(state.gold < background.price) return;

    state = state.copyWith(
      gold: state.gold - background.price,
      backgrounds: [...state.backgrounds, background],
      currentBackgroundIndex: state.backgrounds.length,
    );

    Hive.box<PlayerState>('playerBox').put('player1', state);
  }

  void tapItem() {
    state = state.copyWith(gold: state.gold + state.items[state.currentItemIndex].goldPerTap);
    Hive.box<PlayerState>('playerBox').put('player1', state);
  }

  void changeCurrentItem({required int index}) {
    if(index < 0 || index >= state.items.length) return;
    state = state.copyWith(currentItemIndex: index);
    Hive.box<PlayerState>('playerBox').put('player1', state);
  }

  void changeCurrentBackground({required int index}) {
    if(index < 0 || index >= state.backgrounds.length) return;
    state = state.copyWith(currentBackgroundIndex: index);
    Hive.box<PlayerState>('playerBox').put('palyer1', state);
  }

  bool checkIfItemBought({required Item item}) {
    return state.items.any((invItem) => invItem.name == item.name); 
  }

  bool checkIfPreviousItemWasBought({required Item item}) {
    return state.items.length != staticItems.indexOf(item);
  }

  bool checkIfBackgroundBought({required Background background}) {
    return state.backgrounds.any((invBackground) => invBackground.name == background.name);
  }

  bool checkIfPreviousBackgroundWasBought({required Background background}) {
    return state.backgrounds.length != staticBackgrounds.indexOf(background);
  }


}