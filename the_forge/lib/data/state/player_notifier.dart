
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/static/backgrounds.dart';
import 'package:the_forge/data/static/items.dart';
import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';
import 'package:the_forge/model/player_state.dart';

final playerProvider = StateNotifierProvider<PlayerNotifier, PlayerState>(
  (ref) => PlayerNotifier() 
);


class PlayerNotifier extends StateNotifier<PlayerState> {
  PlayerNotifier() : super(PlayerState(
    gold: 150000000,
    items: [staticItems[0]],
    backgrounds: [staticBackgrounds[0]],
    currentItemIndex: 0,
    currentBackgroundIndex: 0,
  ));

  void buyItem({ required Item item}) {
    if(checkIfItemBought(item: item)) return;
    if(state.gold < item.price) return;

    state = state.copyWith(
      gold: state.gold - item.price, 
      items: [...state.items, item], 
      currentItemIndex: state.items.length, 
    );
  }

  void buyBackground({ required Background background}) {
    if(checkIfBackgroundBought(background: background)) return;
    if(state.gold < background.price) return;

    state = state.copyWith(
      gold: state.gold - background.price,
      backgrounds: [...state.backgrounds, background],
      currentBackgroundIndex: state.backgrounds.length,
    );
  }

  void tapItem() {
    state = state.copyWith(gold: state.gold + state.items[state.currentItemIndex].goldPerTap);
  }

  void changeCurrentItem({required int index}) {
    if(index < 0 || index >= state.items.length) return;
    state = state.copyWith(currentItemIndex: index);
  }

  void changeCurrentBackground({required int index}) {
    if(index < 0 || index >= state.backgrounds.length) return;
    state = state.copyWith(currentBackgroundIndex: index);
  }

  bool checkIfItemBought({required Item item}) {
    return state.items.any((invItem) => invItem.name == item.name); 
  }

  bool checkIfBackgroundBought({required Background background}) {
    return state.backgrounds.any((invBackground) => invBackground.name == background.name);
  }
}