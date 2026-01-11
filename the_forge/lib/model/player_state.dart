import 'package:hive/hive.dart';
import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';

part 'player_state.g.dart';

@HiveType(typeId: 0)
class PlayerState {
  @HiveField(0)
  double gold;

  @HiveField(1)
  List<Item> items;

  @HiveField(2)
  List<Background> backgrounds;

  @HiveField(3)
  int currentItemIndex;

  @HiveField(4)
  int currentBackgroundIndex;

  @HiveField(5)
  int level;

  PlayerState({
    required this.gold,
    required this.items,
    required this.backgrounds,
    required this.currentItemIndex,
    required this.currentBackgroundIndex,
    required this.level
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
    int ? level,
  }) {
    return PlayerState(
      level: level ?? this.level,
      gold: gold ?? this.gold, 
      items: items ?? this.items, 
      backgrounds: backgrounds ?? this.backgrounds, 
      currentItemIndex: currentItemIndex ?? this.currentItemIndex, 
      currentBackgroundIndex: currentBackgroundIndex ?? this.currentBackgroundIndex
    );
  }
}