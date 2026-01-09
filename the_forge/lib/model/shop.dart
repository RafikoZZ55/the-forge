import 'package:the_forge/model/background.dart';
import 'package:the_forge/model/item.dart';

class Shop {
  final List<Item> _itmes;
  final List<Background> _backgrounds;

  Shop({
    required List<Item> items,
    required List<Background> backgrounds,
  }): assert(backgrounds.isNotEmpty,"shop must have backgrounds to sell"),
      assert(items.isNotEmpty,"shop must have items to sell"),
      _itmes = items,
      _backgrounds = backgrounds;

  List<Item> get items => _itmes;
  List<Background> get backgrounds => _backgrounds;
}