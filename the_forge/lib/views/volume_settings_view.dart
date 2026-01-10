import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:the_forge/data/state/sound_effect_notifier.dart";
import "package:the_forge/data/state/theme_music_notifier.dart";

class VolumeSettingsView extends ConsumerStatefulWidget {
  const VolumeSettingsView({ super.key });

  @override
  createState() => _VolumeSettingsViewState();
}

class _VolumeSettingsViewState extends ConsumerState<VolumeSettingsView> {

  @override
  Widget build(BuildContext context) {
    final musicThemePlayerNotyfier = ref.read(themeMusicProvider.notifier);
    final musicThemePlayer = ref.watch(themeMusicProvider);
    double themMusicVoulme = 100;


    final soundEffectNotifier = ref.read(soundEffectProvider.notifier);
    final soundEffect = ref.watch(soundEffectProvider);
    double soundeffectVolume = 100;

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
              label: "${musicThemePlayer.volume * 100}",
              value: musicThemePlayer.volume * 100,
              onChanged: (value){
                setState(() {
                  themMusicVoulme = value;
                });
                musicThemePlayerNotyfier.setVolume(volume: themMusicVoulme);
              },
              divisions: 10,
              max: 100,
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
              label: "${soundEffect.volume * 100}",
              value: soundeffectVolume * 100,
              onChanged: (value) => {
                setState(() {themMusicVoulme = value;}),
                soundEffectNotifier.setVolume(themMusicVoulme)
              },
              divisions: 10,
              max: 100,
              min: 0,
            ),
          ],
        ),
      );
  }
}