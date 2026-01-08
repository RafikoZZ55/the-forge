import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_forge/data/state/player_state.dart';

class ForgeView extends ConsumerStatefulWidget {
  const ForgeView({super.key});

  @override
  ConsumerState<ForgeView> createState() => _ForgeViewState();
}

class _ForgeViewState extends ConsumerState<ForgeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SizedBox(
          width: 250,
          child: InkWell(
            child: Image.asset(ref.watch(player).getCurrentItem().image),
          ),
        ),
      ),
    );
  }
}
