import 'package:flutter/material.dart';
import 'package:the_forge/views/volume_settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body:  VolumeSettingsView()
    );
  }
}


