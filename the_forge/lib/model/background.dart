class Background {
  final String _name;
  final String _background;
  final double _price;

  Background({
    required String name,
    required String background,
    required double price,
  }) : assert(price >= 0,"price of bacgrounds need to be bigger or equal to 0"),
       _name = name,
       _background = background,
       _price = price;

  String get name => _name;
  String get background => _background;
  double get price => _price;

}
