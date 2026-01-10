
import 'package:hive_flutter/hive_flutter.dart';

part 'item.g.dart';

@HiveType(typeId: 2)
class Item {

@HiveField(0)
final String _name;

@HiveField(1)
final String _description;

@HiveField(2)
final String _image;

@HiveField(3)
final double _price;

@HiveField(4)
final double _goldPerTap;

Item ({
  required String name,
  required String description,
  required String image,
  required double price,
  required double goldPerTap,
}) : assert(price > 0,"every item must have a price above 0"),
     assert(goldPerTap >= 1,"every item must generate at least one gold per tap"),
     _name = name,
     _description = description,
     _image = image,
     _price = price,
     _goldPerTap = goldPerTap;

String get name => _name;
String get description => _description;
String get image => _image;
double get price => _price;
double get goldPerTap => _goldPerTap;
}