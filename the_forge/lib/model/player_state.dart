import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';

class PlayerState {
  double _gold;
  List<Item> _items;
  List<Background> _backgrounds;
  int _currentItemIndex;
  int _currentBackgroundIndex;

  PlayerState({
    required double gold,
    required List<Item> items,
    required List<Background> backgrounds,
    required int currentItemIndex,
    required int currentBackgroundIndex,
  }) : assert(gold >= 0, "Gold must be positive"),
       assert(items.isNotEmpty, "user must have starter item"),
       assert(backgrounds.isNotEmpty,"user must have starter background"),
       assert(currentItemIndex >=0 && currentItemIndex < items.length,"item index out of bound"),
       assert(currentBackgroundIndex >= 0 && currentBackgroundIndex < backgrounds.length,"background index out of bound"),
       _gold = gold,
       _backgrounds = backgrounds,
       _items = items,
       _currentBackgroundIndex = currentBackgroundIndex,
       _currentItemIndex = currentItemIndex;

  void buyItem(Item item) {
    if (_gold < item.price) return; 
    if (_items.contains(item)) return;

    _gold -= item.price;
    _items.add(item);
    currentItemIndex = itmes.length - 1;
  }

  void buyBackground(Background background) {
    if (_gold < background.price) return; 
    if (_backgrounds.contains(background)) return;

    _gold -= background.price;
    _backgrounds.add(background);
    currentBackgroundIndex = backgrounds.length -1;
  }

  Item getCurrentItem() => _items[_currentItemIndex];
  Background getCurrentBackground() => _backgrounds[_currentBackgroundIndex];

  set currentItemIndex(int index) {
    if (index >= _items.length || index < 0) return;
    _currentItemIndex = index;
  }

  set currentBackgroundIndex(int index) {
    if(index >= _backgrounds.length || index < 0) return;
    _currentBackgroundIndex = index;
  }

  double get gold => _gold;
  List<Item> get itmes => _items;
  List<Background> get backgrounds => _backgrounds;
  int get currentBackgroundIndex => _currentBackgroundIndex;
  int get currentItemIndex => _currentItemIndex;
}