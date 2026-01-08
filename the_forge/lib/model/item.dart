class Item {

final String _name;
final String _description;
final double _price;
final double _goldPerTap;

Item ({
  required String name,
  required String description,
  required double price,
  required double goldPerTap,
}) : assert(price > 0,"every item must have a price above 0"),
     assert(goldPerTap >= 1,"every item must generate at least one gold per tap"),
     _name = name,
     _description = description,
     _price = price,
     _goldPerTap = goldPerTap;

String get name => _name;
String get description => _description;
double get price => _price;
double get goldPerTap => _goldPerTap;
}