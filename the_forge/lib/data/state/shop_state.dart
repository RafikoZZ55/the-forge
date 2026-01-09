import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/static/backgrounds.dart';
import 'package:the_forge/data/static/items.dart';
import 'package:the_forge/model/shop.dart';

final shop = StateProvider<Shop>((ref) => Shop(
  items: staticItems,
  backgrounds: staticBackgrounds,
));