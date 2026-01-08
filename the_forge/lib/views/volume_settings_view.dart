import "package:flutter/material.dart";

class VolumeSettingsView extends StatefulWidget {
  const VolumeSettingsView({ Key? key }) : super(key: key);

  @override
  _VolumeSettingsViewState createState() => _VolumeSettingsViewState();
}

class _VolumeSettingsViewState extends State<VolumeSettingsView> {
  double musicVolume = 0;
  double soundEffectVolume = 0;

  @override
  Widget build(BuildContext context) {
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
              label: "${musicVolume.round()}",
              value: musicVolume,
              onChanged: (value) => setState(() => musicVolume = value),
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
              label: "${soundEffectVolume.round()}",
              value: soundEffectVolume,
              onChanged: (value) => setState(() => soundEffectVolume = value),
              divisions: 10,
              max: 100,
              min: 0,
            ),
          ],
        ),
      );
  }
}