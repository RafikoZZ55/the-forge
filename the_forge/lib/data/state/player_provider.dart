import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/static/backgrounds.dart';
import 'package:the_forge/data/static/items.dart';
import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';
import 'package:the_forge/model/player_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

final playerProvider = StateNotifierProvider<PlayerNotifier, PlayerState>(
  (ref) {
    final box = Hive.box<PlayerState>('playerBox');
    final player = box.get('player1') ??
        PlayerState(
          gold: 15,
          items: [staticItems.first],
          backgrounds: [staticBackgrounds.first],
          currentItemIndex: 0,
          currentBackgroundIndex: 0,
          level: 0,
        );

    box.put('player1', player);
    return PlayerNotifier(player);
  },
);

class PlayerNotifier extends StateNotifier<PlayerState> {
  PlayerNotifier(super.state);

  Box<PlayerState> get _box => Hive.box<PlayerState>('playerBox');

  void _save() => _box.put('player1', state);

  void buyItem({required Item item}) {
    if (checkIfItemBought(item: item)) return;
    if (!checkIfPreviousItemWasBought(item: item)) return;
    if (state.gold < item.price) return;

    state = state.copyWith(
      gold: state.gold - item.price,
      items: [...state.items, item],
      currentItemIndex: state.items.length,
    );

    _save();
  }

  bool checkIfItemBought({required Item item}) {
    return state.items.any((i) => i.name == item.name);
  }

  bool checkIfPreviousItemWasBought({required Item item}) {
    final index =
        staticItems.indexWhere((i) => i.name == item.name);
    return index == state.items.length;
  }

  void getBackground({required Background background}) {
    if (checkIfBackgroundOwned(background: background)) return;
    if (!checkIfLevelReached(level: background.level)) return;

    state = state.copyWith(
      backgrounds: [...state.backgrounds, background],
    );

    _save();
  }

  bool checkIfBackgroundOwned({required Background background}) {
    return state.backgrounds.any((b) => b.name == background.name);
  }

  void buyLevel() {
    final price = calculatePriceOfNextLevel();
    if (state.gold < price) return;
    changeCurrentItem(index: 0);

    state = state.copyWith(
      gold: 0,
      level: state.level + 1,
      items: [state.items[0]]
    );

    _save();
  }

  bool checkIfLevelReached({required int level}) {
    return state.level >= level;
  }


  void tapItem() {
    final goldGain = state.items[state.currentItemIndex].goldPerTap *
        calculateGoldMultiplier();

    state = state.copyWith(gold: state.gold + goldGain);
    _save();
  }


  void changeCurrentItem({required int index}) {
    if (index < 0 || index >= state.items.length) return;
    state = state.copyWith(currentItemIndex: index);
    _save();
  }

  void changeCurrentBackground({required int index}) {
    if (index < 0 || index >= state.backgrounds.length) return;
    state = state.copyWith(currentBackgroundIndex: index);
    _save();
  }

  double calculatePriceOfNextLevel() {
    return 5000 + state.level * 2000 * state.level / 8;
  }

  double calculateGoldMultiplier() {
    return 1 + (state.level * 0.25);
  }
}
