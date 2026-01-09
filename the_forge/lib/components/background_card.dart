import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/model/background.dart';

class BackgroundCard extends ConsumerStatefulWidget {
  const BackgroundCard({ super.key, required this.background  });
  final Background background;

  @override
  createState() => _BackgroundCardState();
}

class _BackgroundCardState extends ConsumerState<BackgroundCard> {
  @override
  Widget build(BuildContext context) {
    return Card(

    );
  }
}