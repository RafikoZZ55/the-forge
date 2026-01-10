import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:the_forge/data/state/meta_provider.dart";

class VolumeSettingsView extends ConsumerStatefulWidget {
  const VolumeSettingsView({ super.key });

  @override
  createState() => _VolumeSettingsViewState();
}

class _VolumeSettingsViewState extends ConsumerState<VolumeSettingsView> {

  @override
  Widget build(BuildContext context) {
    final metaNotifier = ref.read(metaProvider.notifier);
    final meta = ref.watch(metaProvider);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text("Music volume",
             style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              )
            ),
            Slider(
              label: meta.themeMusicVolume.toString(),
              value: meta.themeMusicVolume,
              onChanged: (value) {
                metaNotifier.setThemeMusicVolume(value);
              },
              divisions: 10,
              max: 1,
              min: 0,
            ),

            const SizedBox(height: 30),
            const Text("Sound effect Volume",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            Slider(
              label: meta.soundEffectVolume.toString(),
              value: meta.soundEffectVolume,
              onChanged: (value) => metaNotifier.setSoundEffectVolume(value),
              divisions: 10,
              max: 1,
              min: 0,
            ),
          ],
        ),
      );
  }
}