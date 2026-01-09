import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';

class PlayerState {
  double gold;
  List<Item> items;
  List<Background> backgrounds;
  int currentItemIndex;
  int currentBackgroundIndex;

  PlayerState({
    required this.gold,
    required this.items,
    required this.backgrounds,
    required this.currentItemIndex,
    required this.currentBackgroundIndex,
  }) : assert(gold >= 0, "Gold must be positive"),
       assert(items.isNotEmpty, "user must have starter item"),
       assert(backgrounds.isNotEmpty,"user must have starter background"),
       assert(currentItemIndex >=0 && currentItemIndex < items.length,"item index out of bound"),
       assert(currentBackgroundIndex >= 0 && currentBackgroundIndex < backgrounds.length,"background index out of bound");

  PlayerState copyWith({
    double? gold,
    List<Item>? items,
    List<Background>? backgrounds,
    int? currentItemIndex,
    int? currentBackgroundIndex,
  }) {
    return PlayerState(
      gold: gold ?? this.gold, 
      items: items ?? this.items, 
      backgrounds: backgrounds ?? this.backgrounds, 
      currentItemIndex: currentItemIndex ?? this.currentItemIndex, 
      currentBackgroundIndex: currentBackgroundIndex ?? this.currentBackgroundIndex
    );
  }
}