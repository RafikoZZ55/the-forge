import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class VolumeSettingsView extends ConsumerStatefulWidget {
  const VolumeSettingsView({ super.key });

  @override
  createState() => _VolumeSettingsViewState();
}

class _VolumeSettingsViewState extends ConsumerState<VolumeSettingsView> {

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
              label: "",
              value: 100,
              onChanged: (value){
            
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
              label: "",
              value: 100,
              onChanged: (value) => {
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