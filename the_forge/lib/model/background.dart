
import 'package:hive/hive.dart';

part 'background.g.dart';

@HiveType(typeId: 1)
class Background {
  @HiveField(0)
  final String _name;

  @HiveField(1)
  final String _background;

  @HiveField(2)
  final int _level;

  Background({
    required String name,
    required String background,
    required int level,
  }) : assert(level >= 0,"level of bacgrounds need to be bigger or equal to 0"),
       _name = name,
       _background = background,
       _level = level;

  String get name => _name;
  String get background => _background;
  int get level => _level;
}
