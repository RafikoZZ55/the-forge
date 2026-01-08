import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/pages/game_page.dart';

void main() {
  runApp(const ProviderScope(child: Main()));
}

class Main extends StatelessWidget {
const Main({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(home: GamePage());
  }
}